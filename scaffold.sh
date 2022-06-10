#!/bin/bash

echo "Enter your GitHub username:"
read username

echo "Before inserting your repository name, make sure you have successfully created a new repository on https://github.com/new for the next steps."
echo "Enter your repository name:"
read repository

echo "Your GitHub username is: $username"
echo "Your repository name is: $repository"

# create a new golang web app on github

git init

git add .

git commit -m "initial commit"

git branch -M main

git remote add origin git@github.com:$username/$repository.git

git push -u origin main

# install the heroku toolbelt
#wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
curl https://cli-assets.heroku.com/install.sh | sh

# login to heroku (providing credentials)

heroku login

# create a new heroku app

heroku create $repository

# push the code to heroku

git push heroku master
