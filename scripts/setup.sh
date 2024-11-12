#!/bin/bash

FOLDER="projects"

if [ ! -d "$FOLDER" ]; then
  mkdir "$FOLDER"
  echo "Folder '$FOLDER' created."
else
  echo "Folder '$FOLDER' already exists."
fi

cd projects

git clone 'git@github.com:ThatLadyDev/notifi-saas.git'
git clone 'git@github.com:ThatLadyDev/billify-saas.git'
git clone 'git@github.com:ThatLadyDev/autho-saas.git'

cd ..

docker compose up -d