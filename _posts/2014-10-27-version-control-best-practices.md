## VERSION CONTROL BEST PRACTICES
### 版本控制最佳实践
----
### Commit Related Changes
A commit should be a wrapper for related changes. For example, fixing two different bugs should produce two separate commits. Small commits make it easier for other team members to understand the changes and roll them back if something went wrong. With tools like the staging area and the ability to stage only parts of a file, Git makes it easy to create very granular commits.
### 基于相关修改的递交
一次递交就是一次对相关变化的包装。例如，修复两个Bug应产生两次独立的递交。轻量的递交能够使团队的其他人能够更易理解这些变化并且便于在发生错误时回滚。因为具有像暂存区这样的工具以及分部件存储文件的能力，Git能够轻易创建粒度极小的递交。

----
### Commit Often
Committing often keeps your commits small and, again, helps you commit only related changes. Moreover, it allows you to share your code more frequently with others. That way it’s easier for everyone to integrate changes regularly and avoid having merge conflicts. Having few large commits and sharing them rarely, in contrast, makes it hard both to solve conflicts and to comprehend what happened.
### 经常性递交
经常性递交能够保证你的每次递交都是轻量的，也能使你仅递交单一变化。另外，它能够让你更频繁的分享自己的代码。这样每个人能够定期整合这些变化从而避免分支合并中的冲突。相反，过少过大的递交会增加解决冲突和对代码变化理解的难度。

---
###Don’t Commit Half-Done Work
You should only commit code when it’s completed. This doesn’t mean you have to complete a whole, large feature before committing. Quite the contrary: split the feature’s implementation into logical chunks and remember to commit early and often. But don’t commit just to have something in the repository before leaving the office at the end of the day. If you’re tempted to commit just because you need a clean working copy (to check out a branch, pull in changes, etc.) consider using Git’s “Stash” feature instead.
###不要递交未完成的工作
应只递交已经完成的代码。这不是说在递交前必须完成整个项目。相反，应将功能实现分割为逻辑块并经常递交他们。但不要为了在下班前在仓库中包含一些文件或信息而递交。如果你仅为了得到一份工作备份而尝试递交（更改分支或者获取变化），考虑使用Git的Stash功能来代替。

---
###Test Before You Commit
Resist the temptation to commit something that you “think” is completed. Test it thoroughly to make sure it really is completed and has no side effects (as far as one can tell). While committing half-baked things in your local repository only requires you to forgive yourself, having your code tested is even more important when it comes to pushing / sharing your code with others.
###递交前请测试
不要在你觉得完成时递交。完整的测试以保证工作完成并且没有其他副作用（只要能判断的）。递交“五分熟的代码”到本地仓库也许只需要你原谅自己，当push和分享代码给他人时，测试则更为重要。

---
###Write Good Commit Messages
Begin your message with a short summary of your changes (up to 50 characters as a guideline). Separate it from the following body by including a blank line. The body of your message should provide detailed answers to the following questions: What was the motivation for the change? How does it differ from the previous implementation? Use the imperative, present tense („change“, not „changed“ or „changes“) to be consistent with generated messages from commands like git merge.
###写下良好的递交信息
用一个简短的概述（50个字符左右）来开始你的递交信息。用一个实线来分离后面的正文。正文应具体说明一下问题：修改的原因是什么？这次递交与之前的实现有什么不同？使用祈使句和现在时与Git的merge命令产生的信息保持一致。

---
###Version Control is not a Backup System
Having your files backed up on a remote server is a nice side effect of having a version control system. But you should not use your VCS like it was a backup system. When doing version control, you should pay attention to committing semantically (see “related changes”) – you shouldn’t just cram in files.
###版本控制不是备份系统
虽然版本控制具有远程备份的功能，但还是应该使用类似VCS的工具进行系统备份。版本控制应更注重语义的递交而不是文件本身。

---
###Use Branches
Branching is one of Git’s most powerful features – and this is not by accident: quick and easy branching was a central requirement from day one. Branches are the perfect tool to help you avoid mixing up different lines of development. You should use branches extensively in your development workflows: for new features, bug fixes, experiments, ideas…
###使用分支
分支是Git中最强大的功能之一，快速和简单的特性一直是开发的基本需求。分支能够很好的帮助你避免混淆开发的不同路线。应在开发流程中广泛的使用分支，例如增加功能，Bug修复，实验性开发，和其他一些想法的实现。

---
###Agree on a Workflow
Git lets you pick from a lot of different workflows: long-running branches, topic branches, merge or rebase, git-flow… Which one you choose depends on a couple of factors: your project, your overall development and deployment workflows and (maybe most importantly) on your and your teammates’ personal preferences. However you choose to work, just make sure to agree on a common workflow that everyone follows.
###工作流支持
Git允许你使用各种不同的工作流程：线性分支，主题分支，合并与复位，Git流等。选择的依据有以下几点：你的项目，你的整个开发和部署流程与你和你团队成员的个性（也许最重要）。无论怎么选择，请保证每个人都工作在一个流程上。