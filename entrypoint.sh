#!/bin/bash

# git setup
BRANCH="$4"
git config --global --add safe.directory /github/workspace
git config --global user.name "Automated Documentation"
git config --global user.email "automated.documentation@users.noreply.github.com"

git checkout --orphan $BRANCH
git reset --hard

# rover

# install rover
ROVER_REPO_FOLDER="rover_setup"
git clone https://github.com/im2nguyen/rover.git $ROVER_REPO_FOLDER
cd "$ROVER_REPO_FOLDER/ui"
npm install 2>&1
npm run build 2>&1
cd ..
go install

echo $(pwd)

# run rover
rover -workingDir "$1" \
    -tfBackendConfig "$2" \
    -tfVarsFile "$3" \
    -standalone true

ROVER_FOLDER="./terraform-rover"

unzip -o rover.zip -d $ROVER_FOLDER

# commit rover output
git add --all $ROVER_FOLDER/\*

# tfdocs

# install tfdocs
#curl -Lo ./terraform-docs.tar.gz https://github.com/terraform-docs/terraform-docs/releases/download/v0.16.0/terraform-docs-v0.16.0-$(uname)-amd64.tar.gz
#tar -xzf terraform-docs.tar.gz
#chmod +x terraform-docs
#mv terraform-docs /usr/local/terraform-docs
go install github.com/terraform-docs/terraform-docs@v0.16.0

terraform-docs markdown table --output-file README.md --output-mode inject "$1"

# commit
git commit --no-verify --allow-empty -m 'Initial gh-pages commit'
git push -f origin $BRANCH