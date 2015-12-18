+++
Categories = ["Development", "git", "Personal"]
Description = "Some useful git commands for daily usage"
Tags = ["Development", "git"]
date = "2015-12-18T05:20:32+00:00"
menu = "main"
title = "Some useful git commands for daily usage"

+++

## Some useful git commands

- Create and delete branches
	* git checkout -b <branchName>
	* git branch -d <branchName>
	* git push origin --delete <branchName>
- See the differences between the branches
	* git checkout <branchName>
	* git cherry <branchName>
- Merge and solve conflicts
	* git checkout --theirs
	* git checkout --ours
	* git merge --no-ff <branchName>
