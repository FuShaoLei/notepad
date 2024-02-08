ole -g='F:\notepad'
cd publish
git init
git remote add origin git@github.com:FuShaoLei/notepad.git
git add .
git commit -m 'update blog'
git push -f --set-upstream origin master:page
cd ..
rm -rf publish
git add .
git commit -m "update"
git push origin master:master

