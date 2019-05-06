#!/bin/bash

USERNAME=asapzacy
REPO_NAME=$1
IS_PUBLIC=true

if [[ $2 == "--private" ]]; then
  IS_PUBLIC=false
fi

cd ~/code

if [ -d "$REPO_NAME" ]; then
  echo "'$REPO_NAME' already exists, exiting."
  exit 1
else
  mkdir $REPO_NAME
  cd $REPO_NAME
fi

curl -u $USERNAME https://api.github.com/user/repos -d "{\"name\": \"$REPO_NAME\", \"public\": \"$IS_PUBLIC\"}"

git init
echo "# $REPO_NAME" > README.md
echo -e ".DS_Store \n .vscode/ \n\n .env \n .ssl/ \n .node_modules/ \n yarn-error.log" > .gitignore

git add .
git commit -m "Initial commit"
git remote add origin git@github.com:$USERNAME/$REPO_NAME.git
git push -u origin master
