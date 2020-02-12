---
layout: post 
title: "linux安装easyconnect"
thumb: /img/in-post/thumbs/linux.png
category: wiki
tags:  "manjaro linux easyconnect"
---
# 前言
由于2020年最开始的新型冠状病毒的发生，导致不得不在家办公，公司使用的在家办公技术是easyconnect，最近easyconnect出了linux版本，但是不支持arch，因此将此记录下来

# 依赖
- debtap 将arch安装使用deb包
- easyconnect.deb 安装包

# 安装
```bash
sudo debtap easyconnect.deb
sudo pacman -U easyconnect.pkg.tar.xz 
```

# 运行
## 错误排查
没有任何反应

解决方案：
- 进入到easyconnect安装目录
- 执行 sudo chmod + easyconnect

报错：(EasyConnect:8913): Pango-ERROR **: 10:41:49.509: Harfbuzz version too old (1.3.1)
- 解决方案[参考蚂蚁笔记的错误](https://leanote.zzzmh.cn/blog/post/admin/%E8%A7%A3%E5%86%B3-Manjaro-Arch-%E7%8E%AF%E5%A2%83%E4%B8%8BLeanote-%E5%90%AF%E5%8A%A8%E6%8A%A5%E9%94%99-Harfbuzz-version-too-old-1.2.1)
- 下载harfbuzz三个包
- 解压到lib文件夹
- 将lib文件夹复制到easyconnect运行目录