jekyll的znan主题
# 使用
```bash
git clone https://github.com/znfang/znfang.github.io.git
```

# 本地调试使用
## 依赖
- nodejs
- ruby
- webpack
## 安装依赖
```bash
npm install # 安装nodejs相关依赖，先需要安装node
webpack -p # 每次修改完js和scss文件需要执行此步骤
bundle install # 安装ruby的相关依赖，先需要安装ruby
bundle exec jekyll server # 本地执行jekyll服务器
```
# 参考
具体操作可以参考[jekyll搭建github个人博客](https://i-znan.github.io/jekyll-github-blog.html)