---
layout: post 
title: "manjaro操作系统知识库"
thumb: /img/in-post/thumbs/linux.png
category: wiki
tags:  "manjaro linux wiki"
---

# 前言
最近卸载了ubuntu，安装了manjaro，简直不要太好用，安装软件真的不要太简单，现在就把一些常用的记录下来，没有从开始记录，有点遗憾，后面再补吧

# 更换国内源
manjaro使用国外源，很慢，所以需要替换国内比较快速的源，操作步骤如下
```
sudo pacman-mirrors -i -c China -m rank    
# 选择其中一个即可，我一般选择中科大或者交大的源，因为离得近。    
sudo vi /etc/pacman.conf     
# 在文件末尾添加以下内容 添加软件源的地址
[archlinuxcn]
SigLevel = Optional TrustedOnly
Serveorngr = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
# 更新缓存    
sudo pacman -Syy    
# 安装archlinuxcn-keyring包，导入GPGKey
sudo pacman -S archlinuxcn-keyring
# 安装更新
sudo pacman -R thunar-archive-plugin
sudo pacman -Syyu
# 安装yaourt,这个是很多非官方的野包，可以通过这个来安装，比如QQ，微信
sudo pacman -S yaourt
```

# mysql
安装过程
```
sudo pacman -S mysql
# 初始化MySQL，记住输出的root密码
sudo mysqld --initialize --user=mysql --basedir=/usr --datadir=/var/lib/mysql
# 设置开机启动MySQL服务
systemctl enable mysqld.service
systemctl daemon-reload
systemctl start mysqld.service
# 使用MySQL前必须修改root密码，MySQL 8.0.15不能使用set password修改密码
mysql -u root -p
mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '新密码';
# 完成
```

# electron-ssr
## 安装 
在add/remove application中搜索electron-ssr即可，然后安装
## 设置开机自启动
```
sudo ln -s /usr/share/applications/electron-ssr.desktop /etc/xdg/autostart/
```
## 相关资料    
[ssr免费地址](https://github.com/Alvin9999/new-pac/wiki/ss%E5%85%8D%E8%B4%B9%E8%B4%A6%E5%8F%B7)    
[gfwlist地址](https://github.com/gfwlist/gfwlist)    
[switchOmega谷歌插件地址](https://github.com/FelisCatus/SwitchyOmega/releases)    
## 谷歌插件配置
- proxy选择socks5协议，server填写127.0.0.1，端口填写1080，应用     
- auto switch中删除所有的switch rules，在rule list config中填写gfwlist中的过滤地址，download profile now按钮，下载过滤地址，格式选择AutoProxy
- 在Switch rules中将规则列表中使用proxy模式，其他使用直接模式，保存应用即可。     
- electron-ssr中直接根据ssr免费地址中的信息填写即可。

# wechat/微信
```
yaourt -S deepin-wine-wechat
```

# TIM/QQ
```
yaourt -S deepin-wine-tim #安装tim
yaourt -S deepin.wine.qq.office #安装qq
```

# NodeJS
## 安装NodeJS
```
pacman -Ss nodejs-lts   //查看nodejs长期支持版
sudo pacman -S nodejs-lts-dubnium   //选择其中一个版本进行安装
npm -v  //查看安装成功没有，如果没有成功执行下条命令
sudo pacman -S npm
```

## 配置npm
```
npm config list //查看npm配置
npm config set prefix "{global_dir}"    //设置全局npm安装路径
npm config set cache ""     //设置全局缓存路径
npm config set registry https://registry.npm.taobao.org     //设置淘宝镜像源
```
以上的set改成get可以查看配置的参数

如果需要在bash或者zsh执行npm安装的组件，需要添加把刚刚的全局安装路径下的bin目录添加到环境变量
```
vim ~/.zshrc  //bash就是.bashrc
export PATH="{global_dir}/bin:$PATH"    //添加到环境变量
source ~/.zshrc
```

## vue初始化
```
npm install -g vue-cli  //vue手脚架
vue init webpack my-project //使用webpack模板初始化
cd my-project
npm install //安装依赖的组件
npm run dev //运行项目，用浏览器打开http://localhost:8080
```

# beyond compare
## 下载
- [beyond compare下载地址](https://www.scootersoftware.com/download.php?zz=kb_linux_install)

## 安装
```
tar -zxvf bcompare-4.3.1.24438.x86_64.tar.gz
cd bcompare-4.3.1.24438
./install.sh    //根据提示输入安装路径{install_dir}
```
## 破解
```
cd {install_dir}/lib64/beyondcompare
```
输入以下命令
```
sudo sed -i "s/keexjEP3t4Mue23hrnuPtY4TdcsqNiJL-5174TsUdLmJSIXKfG2NGPwBL6vnRPddT7tH29qpkneX63DO9ECSPE9rzY1zhThHERg8lHM9IBFT+rVuiY823aQJuqzxCKIE1bcDqM4wgW01FH6oCBP1G4ub01xmb4BGSUG6ZrjxWHJyNLyIlGvOhoY2HAYzEtzYGwxFZn2JZ66o4RONkXjX0DF9EzsdUef3UAS+JQ+fCYReLawdjEe6tXCv88GKaaPKWxCeaUL9PejICQgRQOLGOZtZQkLgAelrOtehxz5ANOOqCaJgy2mJLQVLM5SJ9Dli909c5ybvEhVmIC0dc9dWH+/N9KmiLVlKMU7RJqnE+WXEEPI1SgglmfmLc1yVH7dqBb9ehOoKG9UE+HAE1YvH1XX2XVGeEqYUY-Tsk7YBTz0WpSpoYyPgx6Iki5KLtQ5G-aKP9eysnkuOAkrvHU8bLbGtZteGwJarev03PhfCioJL4OSqsmQGEvDbHFEbNl1qJtdwEriR+VNZts9vNNLk7UGfeNwIiqpxjk4Mn09nmSd8FhM4ifvcaIbNCRoMPGl6KU12iseSe+w+1kFsLhX+OhQM8WXcWV10cGqBzQE9OqOLUcg9n0krrR3KrohstS9smTwEx9olyLYppvC0p5i7dAx2deWvM1ZxKNs0BvcXGukR+/g" BCompare
```
打开beyond compare会提示Trail Mode Error，此时选择Entry key，并输入以下内容
```
--- BEGIN LICENSE KEY ---
GXN1eh9FbDiX1ACdd7XKMV7hL7x0ClBJLUJ-zFfKofjaj2yxE53xauIfkqZ8FoLpcZ0Ux6McTyNmODDSvSIHLYhg1QkTxjCeSCk6ARz0ABJcnUmd3dZYJNWFyJun14rmGByRnVPL49QH+Rs0kjRGKCB-cb8IT4Gf0Ue9WMQ1A6t31MO9jmjoYUeoUmbeAQSofvuK8GN1rLRv7WXfUJ0uyvYlGLqzq1ZoJAJDyo0Kdr4ThF-IXcv2cxVyWVW1SaMq8GFosDEGThnY7C-SgNXW30jqAOgiRjKKRX9RuNeDMFqgP2cuf0NMvyMrMScnM1ZyiAaJJtzbxqN5hZOMClUTE+++
--- END LICENSE KEY -----
```
## 设置桌面应用
```
sudo cp {install_dir}/lib64/beyondcompare/help/bclogo.png /usr/share/icons/
sudo vim /usr/share/applications/bcompare.desktop
```
输入以下内容
```
[Desktop Entry]
Name=beyond-compare
Comment=beyond compare
Exec=/home/znan/Userware/bcompare/bin/bcompare %U
Terminal=false
Type=Application
Icon=bclogo
Categories=Office;
MimeType=
```
