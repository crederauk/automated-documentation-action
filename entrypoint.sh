#!/bin/bash

rover -workingDir "$1" \
    -tfBackendConfig "$2" \
    -tfVarsFile "$3" \
    -standalone true

# unzip to the current directory as gh pages expects index.html etc to be there
unzip -o rover.zip

BRANCH="$4"

git config --global user.name "Automated Documentation"
git config --global user.email "automated.documentation@users.noreply.github.com"

git checkout --orphan $BRANCH
git reset --hard
git add --all 
git commit --no-verify --allow-empty -m 'Initial gh-pages commit'
git push -f origin $BRANCH