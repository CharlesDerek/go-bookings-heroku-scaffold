
#!/bin/bash


CWD=${PWD##*/}

echo "Current folder: $CWD"




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
        sed -i 's/bookings-path/$repository/g' "$file"
    fi
done