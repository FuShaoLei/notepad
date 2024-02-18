## 生成ssh key

```
ssh-keygen -t rsa -C "<你的邮箱>"
```

设置用户名和邮箱

```
git config --global user.email "1563250958@qq.com"
git config --global user.name "fushaolei"
```





## 删除本地分支和远程分支

```
// 删除本地分支
git branch -d <localBranchName>
// 或者 -D 强制删除本地分支

// 删除远程分支
git push origin --delete <remoteBranchName>
```

