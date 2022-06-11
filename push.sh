#!/bin/bash

# TIPS (Primary):
    #command For Linux/Mac -> ./filename.sh
    #command For Windows -> sh file_name.sh
    # variables are written $varName and "With Strings ${branch_message}!"
    # git remote add <name> <url> #(add remote repo)
    # git remote -v #(display remotes)
    # git branch -a #(display current branches including remote branches)
    # git branch -v #(display local only branches, but latest commits as well)
    # git branch <name> #(create a new branch)
    # git branch -d <name> #(delete a branch)
    # git branch -dr <name> #(delete remote branch)
    # git checkout -b <name of branch> #(checkout a branch)
    # git pull <remote> <branch> #(pull latest code from remote branch)
    # git push <remote> <branch> #(push latest local changes to remote branch)
    # git push -u <remote> <branch> #(push upstream)
    # git merge <branch> #(merge other branch into your current working branch)
    # git push origin --delete <branchname> #(delete remote branch on github)

# TIPS (Secondary):
    # git init - creates a git repository
    # git status - lets us see what's going on with a repository

    # # Commands for updating our work
    # git add - get the files ready to be committed (adds them to the staging area)
    # git commit - actually create a snapshot of these changes to our project
    # git push - upload changes to remote

    # ---

    # # Branching commands
    # git checkout -b name-of-new-branch – creates a new branch
        #git push --set-upstream origin name-of-new-branch
            #(links the branch checked out to master/origin)
    # git checkout name-of-branch – switch to a branch
    # git merge name-of-branch – bring the changes from one branch into another

    # git checkout master
    # git merge sprint-1

    # git checkout -b NameOfBranch

    # git status
    # Shows the branch you\'re on

    # remove cached files if added to gitignore :
    # git rm -rf --cached .

#Add:
git add .

#Git message:
git status
echo "Enter Your branch message:"
read branch_message
git status
echo "Your provided git message is: "${branch_message}
git commit -m "${branch_message}"

#Deploy:
if [ -z "$commit" ]; then
    echo "Pushing to Github"
    git push
else
    echo "Commits saved locally"
#   Run local commit only with a abritrary inserted value to unassigned variable `$commit` (Example): ```commit=1 ./push.sh```
fi