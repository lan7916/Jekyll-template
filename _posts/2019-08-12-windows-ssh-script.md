---
layout: post 
title: "windows-ssh运行脚本"
thumb: /img/in-post/thumbs/win.png
category: wiki
tags:  "ssh vbs windows"
---
# 起因
由于经常在windows环境下工作，需要连linux服务器，之前用的xshell过期了，然后其他工具用不习惯，就打算自己开发一个脚本来直接连ssh服务器，故有此文

# 开发环境
- ssh命令支持（cmder工具或者openssh+windows自带的cmd均可）
- vbs环境支持

cmder是一款模仿linux的windows工具，很好用，可以按照这个链接([cmder工具](https://cmder.net/))来下载学习操作，里面包含ssh，git等工具，不需要额外下载，很方便

如果使用自带的cmd，则需要下载openssh，配置ssh环境才能使用，可以按照这个链接([openssh](http://www.mls-software.com/opensshd.html)),拉倒最底下下载

# ssh基本命令
用ssh命令行连接linux服务器主要是以下命令
>ssh username@host    

输入此命令后再输入密码就可以了，因此脚本的思路也是这样实现，最主要的难点是，如何在windows环境下读取命令行当前的状态，即是否在等待输入密码，对于这个问题，博主尝试了很多办法，比如类似于linux的expect，python脚本等，都无法实现，总会有这样那样的问题，最后是参考[leoluo同学的vbs脚本](http://www.sixleoluo.me/computer/tech/325/)实现的

linux服务器环境如下(用的是centos虚拟机):
![server](/img/in-post/windows-ssh/server.png)
主要是看ip地址和用户名

cmder用ssh连linux服务器操作如图:
![ssh-connect](/img/in-post/windows-ssh/ssh-connect.png)
第一次连接时，会出现yes/no操作，输入yes即可，然后再输入密码即可


# 具体实现
根据上面的连接过程，脚本主要代码如下:
```
set ws = createobject("wscript.shell")    
ws.run "cmder.exe"    
wscript.sleep 800    
ws.SendKeys "+"    
ws.SendKeys "ssh root@192.168.93.128"    
ws.SendKeys "{enter}"    
wscript.sleep 800    
ws.SendKeys "root"     
ws.SendKeys "{enter}"    
```

vbs有一个很诡异的地方，就是sendkey操作，默认是跟随系统语言设定输入法的，所以需要在输入命令前切换为英文输入法，即
>ws.SendKeys "+"

具体vbs的相关命令操作，可以参考博文[VBScript中SendKeys的妙用
](https://blog.csdn.net/Feiin/article/details/6447684)

如果你使用的是cmd+openssh的方式的话，需要将
>ws.run "cmder.exe" 改为 ws.run "cmd.exe"

使用的是cmder方式，则需要设置cmder环境变量

# 如何使用
双击即可，或者可以通过命令行
>cd vbs脚本所在目录    
wcsript //e:vbscript ssh.vbs