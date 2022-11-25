#!/bin/ash

# rover subfolder
mkdir rover && cd $_

# install rover
echo "Cloning Rover Git repo"
git clone https://github.com/im2nguyen/rover.git "./source"

echo "Install Rover dependencies and build"
cd "source/ui"
npm install
npm run build

echo "Installing Rover in container"
cd ..
go install

# go back up a level
cd ..