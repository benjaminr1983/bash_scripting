#!/bin/bash
# request the variables
echo
read -p "Please enter the local folder for the repository:  " local_repo_directory && echo
# cd ~/Github/$local_repo_directory
read -p "Please enter your username in git:  " git_user && echo
while true;
do
    read -p "Do you use a passphrase with your private key? [y/n]:  " yn && echo
    case $yn in
	[Yy]* ) read -s -p "Please enter the password of your private key:  " ssh_pwd && echo; break;;
	[Nn]* ) break;;
	* ) echo You entered an invalid answer, please only use y,Y,n,N
    esac
done
echo
read -p "Please enter the repository:  " repo_name && echo
while true;
do
    read -p "Do you want to create a new repository, switch an older repository to ssh or simply push changes in the current repository? [c/s/p]:  " csp && echo
    case $csp in
	# new repository
	[Cc]* ) echo "# $repo_name" >> README.md;
		cp -p ~/Github/LICENSE.md ~/Github/$local_repo_directory/LICENSE.md;
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
	[Pp]* ) git commit -a;
		break;;
	* ) echo You entered an invalid answer, please only use N, n, S, s, P, p
    esac
done
# add the key to ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github
echo $ssh_pwd
# push the changes to git
git push -u origin main
