---
layout: post 
title: "[转载]Java多线程"
thumb: /img/in-post/thumbs/java.png
category: tech
tags:  "java thread"
---
本文转载自[csdn博客-Java多线程编程](https://blog.csdn.net/evankaka/article/details/44153709)，但对其进行了整理

# 1.说明
- 本文所有的源码，均可在我的[github]()上获取
- 本文涵盖内容：多线程使用方法、线程同步、线程数据传递、线程状态及相应的一些线程函数用法、概述等。
- 线程的五个阶段：创建、就绪、运行、阻塞和终止
- Java多线程实现三种方案：继承Thread类、实现Runnable接口和实现Callable接口并与Future、线程池结合使用。

# 2.线程与进程
- 进程有独立的代码和数据空间(进程上下文)，进程间切换有较大开销，一个进程包含1-n个线程，进程是资源分配的最小单位
- 同一类线程共享代码和数据空间，每个线程有独立的运行栈和程序计数器，线程切换开销小，线程是cpu调度的最小单位

# 3.实现方案
## 3.1 继承Thread类
### 代码
```java
package com.znfang;

/**
 * @author znfang
 * @date 20-2-17
 */
public class Thread1 extends Thread{
    private String name;
    public Thread1(String name) {
        this.name = name;
    }

    public void run() {
        for (int i = 0 ; i < 5; i++) {
            System.out.println(name + " run : " + i );
            try {
                sleep((int) (Math.random() * 10));
            }catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
```

```java
package com.znfang;

/**
 * @author znfang
 * @date 20-2-17
 */
public class main {
    public static void main(String[] args) {
        Thread1 thread1 = new Thread1("A");
        Thread1 thread2 = new Thread1("B");
        thread1.start();
        thread2.start();
    }
}
```

### 说明
- 多次运行main函数的时候，输出结果不一样，即多线程之间的工作是没有固定的先后顺序的，且互不影响
- start方法调用后，并不是立即执行多线程代码，而是使该线程变为空运行状态，什么时候运行，由操作系统决定
- sleep方法是不让当前线程独占该进程所获取的cpu

## 3.2 实现Runnable接口
### 代码
```java
package com.znfang;

/**
 * @author znfang
 * @date 20-2-17
 */
public class Thread2 implements Runnable{
    private String name;
    public Thread2(String name) {
        this.name = name;
    }
    @Override
    public void run() {
        for (int i = 0 ; i < 5; i++) {
            System.out.println(name + " run : " + i);
            try {
                Thread.sleep((int) (Math.random() * 10));
            }catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
```
```java
package com.znfang;

/**
 * @author znfang
 * @date 20-2-17
 */
public class main {
    public static void main(String[] args) {
        new Thread(new Thread2("C")).start();
        new Thread(new Thread2("D")).start();
    }
}
```
### 说明
- run方法是多线程程序的一个约定，所有的多线程代码都在run方法里，实际上Thread也是实现了Runnable接口的类
- 需要先通过Thread类的构造方法Thread(Runnable target)构造出对象，然后调用Thread对象的start方法来运行多线程代码

## 3.3 Threa和Runnable的区别
- 如果一个类继承Thread，则不适合资源共享，但如果实现了Runnable接口，则容易实现资源共享
- Runnable适合多个相同的程序代码的程序去处理同一个资源
- Runnable可以避免Java中的单继承限制
- Runnable增加程序的健壮性，代码可以被多个线程共享，代码和数据独立
- 线程池只能放入实现Runnable或Callable类线程，不能直接放入继承Thread的类

# 4.线程转换

![线程状态转换图](/img/in-post/java-thread/thread-state.jpg)

- 新建状态(new)：新创建一个线程对象
- 就绪状态(Runnable)：线程对象创建后，其他线程调用了该对象的start方法，该线程等待获取cpu使用权
- 运行状态(Running)：就绪状态的线程获取了cpu，执行程序代码
- 阻塞状态(Blocked)：线程因为某种原因放弃cpu使用权，暂时停止运行
- 死亡状态(Dead)：线程执行完毕，或者异常情况退出run方法，该线程结束生命周期

## 阻塞情况
- 等待阻塞：运行的线程执行wait()方法，JVM会把该线程放入等待池中。(wait会释放持有的锁)
- 同步阻塞：运行的线程在获取对象的同步锁时，若该同步锁被别的线程占用，则JVM会把该线程放入锁池中。
- 其他阻塞：运行的线程执行sleep()或join()方法，或者发出了I/O请求时，JVM会把该线程置为阻塞状态。


# 5.线程调度
- 优先级搞得线程获得更多的运行机会
- 优先级用1-10的整数表示，Thread类有三个静态常量
- sleep可以使线程进入阻塞状态，可以设定睡眠时间，睡眠结束后进入就绪状态
- object类中的wait方法，可以使得当前线程进入等待状态，直到其他线程调用此对象的notify方法或者notifyAll方法唤醒
- yield方法暂停当前正在执行的线程对象，把执行机会让给相同或者更高优先级的线程
- join方法等待其他线程终止。在当前线程中调用另一个线程的join方法，则当前线程转入阻塞状态，知道另一个线程运行结束，当前线程再由阻塞转为就绪
