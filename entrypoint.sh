#!/bin/bash

rover -workingDir "$1" \
    -tfBackendConfig "$2" \
    -tfVarsFile "$3" \
    -standalone true

ROVER_FOLDER="./rover"

unzip -o rover.zip -d $ROVER_FOLDER

BRANCH="$4"
#OIDC_TOKEN="$5"

git config --global user.name "Automated Documentation"
git config --global user.email "automated.documentation@users.noreply.github.com"

git checkout --orphan $BRANCH
git reset --hard
git add --all $ROVER_FOLDER/\*
git commit --no-verify --allow-empty -m 'Initial gh-pages commit'
git push origin $BRANCH -f