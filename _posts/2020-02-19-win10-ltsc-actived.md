---
layout: post 
title: "win10企业版ltsc激活"
thumb: /img/in-post/thumbs/win.png
category: wiki
tags:  "win10 ltsc 激活"
---

# 说明
ltsc版本是没有其他应用商店等东西的简约版本，很适合使用

# 操作
管理员身份打开cmd，并依次输入以下指令
```bash
slmgr -ipk M7XTQ-FN8P6-TTKYV-9D4CC-J462D
slmgr -skms kms.03k.org
slmgr -ato
slmgr -dlv
```
每次弹出对话框，都点击确定即可。