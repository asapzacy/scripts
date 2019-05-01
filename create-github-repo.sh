#!/bin/bash

USERNAME='asapzacy'
REPO_NAME=$1

cd ~/code
mkdir $REPO_NAME && cd $REPO_NAME

curl -u $USERNAME https://api.github.com/user/repos -d "{\"name\": \"$REPO_NAME\"}"

git init
echo "# $REPO_NAME" > README.md
echo -e ".DS_Store \n .vscode/ \n\n .env \n .ssl/ \n .node_modules/ \n yarn-error.log" > .gitignore
git add .
git commit -m "Initial commit"
git remote add origin git@github.com:$USERNAME/$REPO_NAME.git
git push -u origin master
