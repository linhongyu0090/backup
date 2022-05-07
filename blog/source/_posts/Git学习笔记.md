---
title: Git学习笔记
date: 2022-04-17 20:40:12
tags:
---
1. 新建文件夹mkdir 
2. 进入文件夹cd 
3. 显示当前目录pwd
4. 修改文件vi 
-  Esc 退出输入状态 
-  shift + ;  + q! 不保存文件的写入修改
-  shift + ; + wq!是保存文件的写入修改
5. 查看上一次对某一文件的修改git diff

6. 命令显示从最近到最远的提交日志git log
    使用git log--pretty=oneline可以更加清晰得看出每次的commit(快照),一大串类似1094adb...的是commit id（版本号）

7. 查看文件cat

8. 命令
   ```c
   git checkout -- readme.txt
   ```
   意思就是，把readme.txt文件在工作区的修改全部撤销,**git checkout其实是用版本库里的版本替换工作区的版本**，无论工作区是修改还是删除，都可以“一键还原”。

9. 用命令git reset HEAD可以把暂存区的修改撤销掉（unstage），重新放回工作区

10. git reset --hard HEAD^可以回退到上一个版本,上上一个版本就是HEAD^^，当然往上100个版本写100个^比较容易数不过来，所以写成HEAD~100

11. 如果想撤销回退的操作，git reset —hard <commit id>

12. Git提供了一个命令git reflog用来记录你的每一次命令,可以查看每一次的commit id

13. git diff HEAD -- readme.txt命令可以查看工作区和版本库里面最新版本的区别

14. 在文件管理器中把没用的文件删了，或者用rm命令删了,确实要从版本库中删除该文件，那就用命令git rm删掉，并且git commit

15. 命令git rm用于删除一个文件。如果一个文件已经被提交到版本库，那么你永远不用担心误删，但是要小心，你只能恢复文件到最新版本，你会丢失最近一次提交后你修改的内容。

16. 可以很轻松地把误删的文件恢复到最新版本：git checkout -- test.txt

17. 在本地的learngit仓库下运行命令：$ git remote add origin git@github.com:linhongyu0090/learngit.git。添加后，远程库的名字就是origin，这是Git默认的叫法，也可以改成别的，但是origin这个名字一看就知道是远程库。下一步，就可以把本地库的所有内容推送到远程库上：$ git push -u origin master

18. 只要本地作了提交，就可以通过命令：$ git push origin master把本地master分支的最新修改推送至GitHub

19. 如果添加的时候地址写错了，或者就是想删除远程库，可以用git remote rm <name>命令。使用前，建议先用git remote -v查看远程库信息：
    $ git remote -v
    origin  git@github.com:linhongyu0090/learn-git.git (fetch)
    origin  git@github.com:linhongyu0090/learn-git.git (push)
    然后，根据名字删除，比如删除origin：
    $ git remote rm origin
    此处的“删除”其实是解除了本地和远程的绑定关系，并不是物理上删除了远程库。远程库本身并没有任何改动。要真正删除远程库，需要登录到GitHub，在后台页面找到删除按钮再删除。

20. 远程库已经准备好了，下一步是用命令git clone克隆一个本地库：
    $ git clone git@github.com:linhongyu0090/gitskills.git
    注意把Git库的地址换成你自己的，然后进入gitskills目录看看，已经有README.md文件了：
    $ cd gitskills
    $ ls
    README.md
    用https://github.com/michaelliao/gitskills.git这样的地址。实际上，Git支持多种协议，默认的git://使用ssh，但也可以使用https等其他协议

21. 首先，我们创建dev分支，然后切换到dev分支：
    $ git checkout -b dev
    git branch命令会列出所有分支，当前分支前面会标一个*号。
    然后，我们就可以在dev分支上正常提交，比如对readme.txt做个修改
    现在，dev分支的工作完成，我们就可以切换回master分支：
    $ git checkout master
    现在，我们把dev分支的工作成果合并到master分支上：
    $ git merge dev
    合并完成后，就可以放心地删除dev分支了：
    $ git branch -d dev
    switch
    我们注意到切换分支使用git checkout <branch>，而前面讲过的撤销修改则是git checkout -- <file>，同一个命令，有两种作用，确实有点令人迷惑。
    实际上，切换分支这个动作，用switch更科学。因此，最新版本的Git提供了新的git switch命令来切换分支：
    创建并切换到新的dev分支，可以使用：
    $ git switch -c dev
    直接切换到已有的master分支，可以使用：
    $ git switch master

22. 测试流程=> 修改文件 git add 修改文件 git commit 最终提交的是第一次修改 而不是文件最终的样子 
    证明：提交的是修改而不是文件
    所以确保在commie 前add所有文件
    命令git checkout -- readme.txt意思就是，把readme.txt文件在工作区的修改全部撤销，这里有两种情况：
    一种是readme.txt自修改后还没有被放到暂存区，现在，撤销修改就回到和版本库一模一样的状态；
    一种是readme.txt已经添加到暂存区后，又作了修改，现在，撤销修改就回到添加到暂存区后的状态。
    总之，就是让这个文件回到最近一次git commit或git add时的状态。
    场景1：当你改乱了工作区某个文件的内容，想直接丢弃工作区的修改时，用命令git checkout -- file。
    场景2：当你不但改乱了工作区某个文件的内容，还添加到了暂存区时，想丢弃修改，分两步，第一步用命令git reset HEAD <file>，就回到了场景1，第二步按场景1操作。
    场景3：已经提交了不合适的修改到版本库时，想要撤销本次提交，参考版本回退一节，不过前提是没有推送到远程库。

23. 进入虚拟环境存放目录：% cd ~/virtualEnvs
    查看所有的环境：% lsvirtualenv 
    切换到指定的环境（比如env1）：%workon env1
    在指定的环境下为所欲为
* 比如pip install ...

* 查看该环境的包% lssitepackages

* 进入当前环境：% cdvirtualenv

* 进入当前环境site-packages: $%cdsitepackages
  退出虚拟环境：% deactivate 
  复制虚拟环境：% cpvirtualenv env1 env3 #把env1复制到env3，可不用事先创建env3
  删除环境: % rmvirtualenv env1
24. 创建新的分支 git checkout -b dev
    相当于:git branch dev
    git checkout dev

25. 列出所有分支 git branch

26. 把dev分支的工作成果合并到master分支上 git merge dev

27. 删除dev分支了git branch -d dev

28. 切换到新的dev分支
    ```c
    git switch -c dev
    ```
29. 直接切换到已有的`master`分支，可以使用：
    ```c
    $ git switch master
    ```

30. git alias:
- inhongyu@bogon learngit % git config --global alias.co checkout
- linhongyu@bogon learngit % git config --global alias.ci commit
- linhongyu@bogon learngit % git config --global alias.br branch
- linhongyu@bogon learngit % git config --global alias.unstage 'reset HEAD'
- linhongyu@bogon learngit % git config --global alias.last 'log -1'
