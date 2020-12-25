#!/bin/bash
# request the variables
git_user=$(git config --list | grep user.name | sed 's/.*[=] *//')
echo
read -p "Please enter the local folder for the repository:  " local_repo_directory && echo
# cd ~/Github/$local_repo_directory
read -p "Please enter the repository:  " repo_name && echo
while true;
do
    read -p "Do you want to create a new repository, switch an older repository to ssh or simply push changes in the current repository? [c/s/p/r]:  " cspr && echo
    case $cspr in
	# new repository
	[Cc]* ) echo "# $repo_name" >> README.md;
		cp -p ~/Github/LICENSE.md ~/Github/$local_repo_directory/LICENSE;
		git init;
		git add .;
		git commit -a;
		git branch -M main;
		git remote add origin git@github.com:$git_user/$repo_name.git;
		break;;
	# update existing repository
	[Ss]* ) git commit -a;
		git remote set-url origin git@github.com:$git_user/$repo_name.git;
		break;;
	# push updates
	[Pp]* ) git add .;
		git commit -a;
		break;;
	# pull updates
	[Rr]* ) break;;
	* ) echo You entered an invalid answer, please only use N, n, S, s, P, p
    esac
done
# add the key to ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github
while true;
do
    read -p "Do you want to push (p) or pull (s) the repository?  " ps && echo
    case $ps in
	# push changes to git
	[Pp]* ) git push -u origin main;
		break;;
	# pull changes from git
	[Ss]* ) git pull origin main;
		break;;
	* ) echo You entered an invalid answer, please only us P, p, S, s
    esac
done
