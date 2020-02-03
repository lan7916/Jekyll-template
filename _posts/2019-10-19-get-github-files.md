---
layout: post 
title: "解决github下载缓慢"
thumb: /img/in-post/thumbs/wiki.png
category: wiki
tags:  "github git"
---
# 前言
从github上git clone太缓慢，实在是忍受不了，但是又没有钱买vpn，于是想了一个折中的办法，从gitee上操作

# 操作过程
- 注册[gitee](https://gitee.com)账号
- 点击新建项目按钮
- 选择从github中导入
- 等待导入完成，从gitee上git clone项目

基本上以上几个步骤就可以从github上成功clone文件了，什么修改hosts文件，都是假的，我就从来没有成功过。

# 其他
如果想让代码继续在github上托管，则进行以下几个步骤即可，如果不进行以下步骤，则提交代码时会提交到码云
- git remote -v  #查看远程分支情况
- git remote rm [name]  #删除已经存在的远程地址，此处应该是gitee地址
- git remote add [name] [url]  #添加新的远程地址，此处应该是github的地址，https和ssh均可
- git pull [name] master #拉取新的远程地址代码,name是本地添加的，master是远程分支，视情况更改