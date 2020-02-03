---
layout: post 
title: "linux的QQ/微信使用快捷键"
thumb: /img/in-post/thumbs/wiki.png
category: wiki
tags:  "wechat qq xdotool linux wiki"
---

# 前言
虽然deepin-wine封装了qq和微信，但是没有快捷键，依旧很不好用，因此琢磨了好久，终于使用xdotool解决了快捷键的问题

# 原理
xdotool是一款模拟键盘操作的软件，因此可以使用xdotool来模拟键盘，完成快捷键的转发

# 操作过程
## 安装xdotool
本文提供manjaro的安装方式如下，其他linux系统请自行搜索
```
sudo pacman -S xdotool
```
## 测试微信和tim的模拟状态
```
xdotool key --window $(xdotool search --name 'tim' | head -n1) ctrl+alt+x
xdotool key --window $(xdotool search --limit 1 --all --pid $(pgrep WeChat.exe)) ctrl+alt+w
```
后面三个组合键要看自己的tim提取消息的快捷键是啥，注意微信和QQ的搜索形式不同    
正常情况下，如果QQ和微信的快捷键对的话，就可以打开QQ或者微信的消息框了    
## 编写脚本并赋权    
在自己的目录下编写.sh的脚本，博主分别在自己个人目录下创建了wechat.sh和tim.sh文件，分别将上述的命令写入，可以直接./wechat.sh执行，如果权限不够，使用下面命令行提权
```
sudo chmod 777 wechat.sh
```
然后再执行，正确的话，就可以进行快捷键绑定了
## 绑定快捷键
file finder-->keyboard-->shortcuts-->add-->选择刚刚的脚本-->save-->输入快捷键（可自定义）

# 说明
以上就是tim/wechat的linux环境下快捷键的绑定，但是wechat好像存在一个问题，就是退出的时候，其实进程并没有kill掉，需要手动kill，否则再次打开微信的时候，快捷键不能生效
另外，微信在deepin-wine为4.7版本下，不能输入中文输入法，需要把deepin-wine版本降为4.6，可以使用下面命令进行降级
```
wget https://archive.archlinux.org/packages/w/wine/wine-4.16-1-x86_64.pkg.tar.xz
# 也可以进入到官方网址：https://archive.archlinux.org/packages/w/wine/ 手动下载
sudo pacman -U wine-4.16-1-x86_64.pkg.tar.xz
```