bundle exec jekyll build
cd ../web
git pull 
rm -rf ./*
mv ../master/_site/* ./
git add .
git commit -m "更新页面"
git push