+++
Categories = ["Development", "git", "Personal"]
Description = "Some useful git commands for daily usage"
Tags = ["Development", "git"]
date = "2015-12-18T05:20:32+00:00"
title = "Some useful git commands for daily usage"

+++

## git commands that I use mostly

- Create and delete branches
	* git checkout -b `branchName`
	* git branch -d `branchName`
	* git push origin --delete `branchName`
- See the differences between the branches
	* git checkout `branchName`
	* git cherry `branchName`
- Merge and solve conflicts
	* git checkout --theirs
	* git checkout --ours
	* git merge --no-ff `branchName`
- Find the branches that are merged into or not merged into a branch
	* git branch --merged `branchName`
    * git branch --no-merged `branchName`
- Find the files that are changed in a branch after a commit
	* git diff --name-only `commitHash`
