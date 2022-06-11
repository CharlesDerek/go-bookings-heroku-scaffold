#!/bin/bash

CWD=${PWD##*/}

#Install Golang:
if ! type "go" > /dev/null; then
   echo "Go is not installed. Installing..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        sudo brew install -y go
    elif [[ "$OSTYPE" == "linux-gnu" ]]; then
        # linux
        sudo apt-get -y install golang
    elif [[ "$OSTYPE" == "freebsd"* ]]; then
        echo "Install go for freebsd systems"
        sudo pkg install -y go
        echo "FreeBSD is not supported."
    elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows:
        echo "Install go for windows (cygwin)"
        curl -O https://storage.googleapis.com/golang/go1.4.2.windows-amd64.msi
        msiexec /i go1.4.2.windows-amd64.msi
        echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
    elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW):
        echo "Install go for windows (msys)"
        curl -O https://storage.googleapis.com/golang/go1.4.2.windows-amd64.msi
        msiexec /i go1.4.2.windows-amd64.msi
        echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
    elif [[ "$OSTYPE" == "win32" ]]; then
        # windows (win32)):
        echo "Error: Go is not supported on 32 bit operating systems."
        exit 1
    else
        echo "Error: Unknown OS."
        exit 1
    fi
else
   echo "Go is installed."
fi

echo "Enter your GitHub username:"
read username

echo "Before inserting your repository name, make sure you have successfully created a new repository on https://github.com/new for the next steps."
echo "Enter your repository name:"
read repository

echo "Your GitHub username is: $username"
echo "Your repository name is: $repository"

# Rename CWD && S&R configs to new repository name:
cd ../
mv $CWD $repository
CWD=$repository
cd $CWD
for file in *
do
    if [ -f "$file" ]
    then
        sed -i "s/bookings-path/$repository/g" "$file"
    fi
done

# create a new golang web app on github

if [ -d ".git" ]; then
    echo "The .git repository has already been initialized."
else
    echo "The .git has not been initialized. Initializing..."
    git init
    git add .
    git commit -m "initial commit"
    git branch -M main
    git remote add origin git@github.com:$username/$repository.git
    git push -u origin main
fi

git remote add master

# install the heroku toolbelt
#wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
curl https://cli-assets.heroku.com/install.sh | sh

# login to heroku (providing credentials)

heroku login

# create a new heroku app

heroku create -a $repository

# push the code to heroku

git push heroku main
