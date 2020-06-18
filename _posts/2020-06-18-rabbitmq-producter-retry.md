---
layout: post 
title: "rabbitmq生产者重发机制"
thumb: /img/in-post/thumbs/spring-boot.png
category: tech
tags:  "spring-boot java rabbitmq"
---
# 说明
重发机制是在mq中很重要的一部分，消费者可以通过ack或者nack就可以很轻松实现消息重新入队列，然后进行重发，但是生产者也有可能在网络动荡的情况下，投递不成功，这个时候就需要消息重发。虽然rabbitmq提供了事务功能，但是如果开启事务，就太影响性能了。本文利用spring-boot的定时功能，在本地缓存，从而实现对失败的消息进行重发。完整的项目代码请参考本人[spring-boot练习代码](https://github.com/znfang/spring-boot/tree/master/spring-boot-rabbitmq-retry)

# 实现过程
## pom依赖
在pom文件中引入rabbitmq依赖
```xml
  <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-amqp</artifactId>
  </dependency>
```

## yaml文件
在yaml文件中添加以下配置，一定要开启手动确认和手动返回
```yaml
spring:
  rabbitmq:
    host: localhost
    port: 5672
    username: guest
    password: guest
    publisher-confirms: true
    publisher-returns: true
```

## msgWithTime
为了进行消息重发，需要重新定义一个结构，来保存带时间和特殊标记的消息，同时需要记录下来之前是用什么类进行分发的，也就是要记录下来之前分发到哪个队列。具体结构如下
```java
@Getter
@Setter
@NoArgsConstructor
@Component
public class MsgWithTime {
    private long id;
    private long time;
    private Object msg;
    private MsgSender sender;

    public MsgWithTime(long id, long time, Object msg) {
        this.id = id;
        this.time = time;
        this.msg = msg;
    }
}
```

## RetryStruct
重试结构体。用map缓存了每次消息发送记录，在后续的confirm阶段如果成功了就删除，如果失败了就进行定时任务重发
```java
@Getter
@Setter
@Component
public class RetryStruct {
    private AtomicLong id = new AtomicLong();
    private Map<Long, MsgWithTime> map = new ConcurrentHashMap<>();


    public long generateId() {
        return id.incrementAndGet();
    }

    public void add(MsgWithTime msg) {
        map.putIfAbsent(msg.getId(), msg);
    }

    public void del(long id) {
        map.remove(id);
    }
}
```

## RetrySchedule
定时任务重发。默认认为在固定的时间段内，如果还存在在map中的消息，没有发送成功，需要进行重发，并且尝试重发几次后，如果仍然失败，则不会进行直接删除，并记录日志
```java
@Slf4j
@Component
public class RetrySchedule {
    @Autowired
    private RetryStruct retryStruct;
    @Scheduled(fixedDelay = MqConstant.RETRY_INTERVAL)
    public void retry() {
        long now = System.currentTimeMillis();

        for (Map.Entry<Long,MsgWithTime> entry : retryStruct.getMap().entrySet()) {
            MsgWithTime msg = entry.getValue();

            if (null != msg) {
                if (msg.getTime() + MqConstant.RETRY_TIME * MqConstant.VALID_TIME < now) {
                    log.info("send message {} failed after 3 min ", msg);
                    retryStruct.del(entry.getKey());
                } else if (msg.getTime() + MqConstant.VALID_TIME < now) {
                    boolean res = msg.getSender().send(msg);
                    if (!res) {
                        log.info("retry send message failed {}", msg);
                    }
                }
            }
        }
    }
}
```

## Sender
消息发送类，主要是为了将消息发送到某个队列中，如果会存在多个队列，那么需要定义一个接口，然后全都实现这个接口就行了。这里就直接列出实现类。其中需要利用CorrelationData，发送之前要将信息加入到map中。
```java
/**
 * 消息发送接口实现
 */
@Slf4j
@Service
public class MsgSenderImpl implements MsgSender {
    @Autowired
    private RabbitTemplate rabbitTemplate;
    @Autowired
    private RetryStruct retryStruct;
    @Override
    public boolean send(Object msg) {
        long id = retryStruct.generateId();
        long time = System.currentTimeMillis();
        return send(new MsgWithTime(id, time, msg));
    }

    @Override
    public boolean send(MsgWithTime msg) {
        msg.setSender(this);
        retryStruct.add(msg);
        CorrelationData data = new CorrelationData(String.valueOf(msg.getId()));
        try {
            rabbitTemplate.convertAndSend(MqConstant.EXCHANGE, MqConstant.ROUTE_KEY, msg.getMsg().toString(), data);
        }catch (Exception e) {
            log.error("send failed: " + e.getMessage());
            return false;
        }
        return true;
    }
}
```

## rabbitTemplate
这里需要交代一下return和confirm的返回时间。confirm是消息到达exchange的时候返回。return是从exchange提交到queue的时候返回。因此，如果有return的消息，则直接进行重发就可以了，而confirm失败才会定时重发，两个是不一样的

添加rabbitTemplate的配置代码。需要实现returncallback和confirmcallback接口，需要开启手动确认和手动返回,如果确认结果成功，则删除map内容，如果失败，则记录日志，后续定时任务会自动重发的。，具体代码如下
```java
/**
 * rabbitmq template配置
 */
@Slf4j
@Configuration
public class RabbitConfig implements RabbitTemplate.ReturnCallback, RabbitTemplate.ConfirmCallback {
    @Autowired
    private RabbitTemplate rabbitTemplate;
    @Autowired
    private RetryStruct retryStruct;
    @PostConstruct
    public void init() {
        rabbitTemplate.setMandatory(true);
        rabbitTemplate.setConfirmCallback(this);
        rabbitTemplate.setReturnCallback(this);
    }
    @Override
    public void confirm(CorrelationData correlationData, boolean b, String s) {
       if (b){

           String id = correlationData.getId();
           log.info("send success " + id);
           if (id != null){
               retryStruct.del(Long.valueOf(id));
           }
       } else {
           log.error("send failed: " + correlationData.getId());
       }
    }

    @Override
    public void returnedMessage(Message message, int i, String s, String s1, String s2) {
        try {
            Thread.sleep(1000);
        }catch (InterruptedException e){
            log.error("sleep error " + e.getMessage());
        }

        log.error("send failed: " + i + " " + s + " " + s1 + " " + s2);
        rabbitTemplate.send(message);
    }
}
```

# 结束语
spring-boot和rabbitmq都是很好用的，后续会写一些关于spring-boot的例子