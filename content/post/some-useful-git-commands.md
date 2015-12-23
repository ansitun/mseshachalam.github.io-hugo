+++
categories = ["development", "git", "personal"]
description = "Some useful git commands for daily usage"
tags = ["development", "git"]
date = "2015-12-18T05:20:32+00:00"
title = "Some useful git commands for daily usage"

+++

## git commands that I use mostly

- Create and delete branches
	* git checkout -b `branchName`
    	- _Creates a branch_
	* git branch -d `branchName`
    	- _Deletes a branch from local_
	* git push origin --delete `branchName`
    	- _Deletes a branch from remote_
- See the differences between the branches
	* git checkout `branchName`
	* git cherry `otherBranchName`
    	- _Shows the commits that are present in `branchName` and not in `otherBranchName`_
- Merge and solve conflicts
	* git checkout --theirs
    	- _Gets the file from current branch_
	* git checkout --ours
    	- _Gets the file from other branch_
	* git merge --no-ff `branchName`
    	- _Merges `branchName` commits to current branch and creates a merge commit_
- Find the branches that are merged into or not merged into a branch
	* git branch --merged `branchName`
    	- _Shows all the branches that are merged to `branchName`_
    * git branch --no-merged `branchName`
    	- _Shows all the branches that are not merged to `branchName`_
- Find the files that are changed in a branch after a commit
	* git diff --name-only `commitHash`
    	- _Lists out the files that are changed after a `commitHash`_
- Apply a dropped stash
	* [Apply dropped stash](http://stackoverflow.com/questions/89332/how-to-recover-a-dropped-stash-in-git)
