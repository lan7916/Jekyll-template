---
layout: post 
title: "linux自动化部署jekyll博客"
thumb: /img/in-post/thumbs/wiki.png
category: wiki
tags:  "blog linux jekyll gitee"
---
# 操作原理
主要是利用gitee的webhook功能，当push到gitee的时候，会自动化pull代码并且进行编译，使用nginx部署
这大概是最全的linux自动化部署博客，包含域名申请，域名解析，内网穿透等

# 准备工作
## 域名
看自己财力情况是否需要申请付费域名，本人使用的是免费域名[freenom](https://my.freenom.com/clientarea.php?managedns=znan.ml&domainid=1081098348),在这个地方可以申请到免费的顶级域名，具体申请步骤可以参考[freenom免费域名申请](https://blog.csdn.net/chen_jianjian/article/details/90636901)

## 域名解析
申请好域名之后，需要dns服务器对域名进行解析，同样有付费有免费的，本人使用的是免费dns域名解析[cloudflare](https://dash.cloudflare.com/511a2d53a15dac8da591e7fc69bc63d5/znan.ml)，这是个国外的服务器，具体操作步骤可以参考[cloudflare免费使用教程](https://www.jianshu.com/p/1e73c2d66ac8)

## 内网穿透
同样，内网穿透也有很多品牌可以选择，这里推荐[sunny-ngrok](http://www.ngrok.cc/),每个用户只能申请一个免费的渠道，具体操作步骤可以参考[sunny-ngrok实现自定义域名内网穿透](https://www.jianshu.com/p/6d119658a8b3)

以上均是免费使用的完全满足需求，只是内网穿透是国外服务器，可能速度较慢，不过影响不大，当用户量上来了之后，可以考虑使用付费产品。

## gitee账号
需要在[gitee官网](https://gitee.com/)申请账号，并创建一个项目，同时需要创建拉倒linux本地

## linux服务器
linux服务器一台，推荐centos7，并安装git，nodejs，nginx

# 服务器端配置
服务端配置主要分为以下几个步骤
- webhook脚本配置
- deploy部署脚本
- nginx配置文件修改
- nat内网穿透（看情况是否需要内网穿透）

## webhook脚本
在服务器端安装nodejs，并且新建一个目录，里面保存webhook脚本和自动化部署脚本
```bash
npm init # 初始化项目，便于以后迁移
npm install gitee-webhook-handler --save # gitee webhook的处理js
touch webhook.js # 创建webhook脚本
vim webhook.js # 编辑webhook脚本
```

在vim编辑器中输入以下内容
```javascript
var http = require('http')
var createHandler = require('gitee-webhook-handler')
var handler = createHandler({ path: '/webhooks_push', secret: '123456' })# post 所需要用到的秘钥

function run_cmd(cmd, args, callback) {
  var spawn = require('child_process').spawn;
  var child = spawn(cmd, args);
  var resp = "";
  child.stdout.on('data', function(buffer) { resp += buffer.toString(); });
  child.stdout.on('end', function() { callback (resp) });
}
handler.on('error', function (err) {
  console.error('Error:', err.message)
})
handler.on('Push Hook', function (event) {  # 这个地方就是GitHub 和 Gitee 不一样的地方，需要注意
  console.log('Received a push event for %s to %s',
    event.payload.repository.name,
    event.payload.ref);
    run_cmd('sh', ['./deploy.sh'], function(text){ console.log(text) });# 需要执行的脚本位置
})
try {
  http.createServer(function (req, res) {
    handler(req, res, function (err) {
      res.statusCode = 404
      res.end('no such location')
    })
  }).listen(6666) # 服务监听的端口，可以自行修改
}catch(err){
  console.error('Error:', err.message)
}
```

# deploy脚本
在webhook同级目录下新建deploy.sh脚本，并写入以下内容
```bash
cd ../blog  # 根据自己的目录存放blog代码位置
git pull    # 从gitee拉去代码
bundle exec jekyll build # 编译构建jekyll
\cp -rf _site/* /usr/share/nginx/html/ # 将编译好的静态文件放入nginx代理目录
```

# nginx配置
安装好nginx后，可以启动nginx，然后根据测试页面查看到nginx所在目录，并修改nginx.conf，具体配置可以参考如下
```conf
user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

include /usr/share/nginx/modules/*.conf;

events {
    worker_connections 1024;
}

http {
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 2048;

    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;

    include /etc/nginx/conf.d/*.conf;

    server {
        listen       80 default_server;
        listen       [::]:80 default_server;
        server_name  _;
        root         /usr/share/nginx/html;

        include /etc/nginx/default.d/*.conf;

        location / {
        }

        error_page 404 /404.html;
            location = /40x.html {
        }

        error_page 500 502 503 504 /50x.html;
            location = /50x.html {
        }
    }
}
```
# 内网穿透
本文使用的是sunny-ngrok，下载好官网提供的运行文件后，本地shell运行
```shell
sh sunny clientid [id] # id是之前sunny-ngrok申请的那个id
```
# 网页设置
网页设置主要是对gitee项目的webhook操作，具体步骤为，选择项目--->设置----->webhook--->将服务器的ip或者前面穿透的域名+上述webhook填写的路径配上，还有之前webhook.js配置的密码填上，点击确认即可，如
```shell
http://192.168.1.109/webhooks_push  # 服务器ip+webhook.js配置的url
123456                              # webhook.js配置的秘钥
```
需要注意的是webhook.js脚本中写的监听端口是多少，在sunny-ngrok申请的网站需要将监听端口改成一样的，不然无法监听。