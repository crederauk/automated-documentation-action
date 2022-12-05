#!/bin/ash

# cd rover subfolder
cd rover

# install rover
# echo "Cloning Rover Git repo"
# git clone --depth 1 https://github.com/im2nguyen/rover.git source

echo "Install Rover dependencies and build"
cd "source/ui"
npm install
npm run build

echo "Installing Rover in container"
cd ..
go install

# go back up a level
echo 'In subfolder'
ls $(pwd)
cd ..

echo 'Out of subfolder'
ls $(pwd)