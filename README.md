jekyll的znfang主题，参考[fooleap博客](https://blog.fooleap.org)修改的，去掉了他博客里面个性化的东西。

集成了disqus和valine两种评论，具体可以看_config.yml配置

效果请参考[本人博客](http://home.znfang.ml)

# 使用
```bash
git clone git@github.com:znfang/Jekyll-template.git
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
具体操作可以参考[jekyll搭建github个人博客](https://znan.ml/jekyll-github-blog.html)