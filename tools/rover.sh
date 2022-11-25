#!/bin/ash

# install rover
echo "Cloning Rover Git repo"
git clone https://github.com/im2nguyen/rover.git "rover/source"

echo "Install Rover dependencies and build"
cd "rover/source/ui"
npm install
npm run build

echo "Installing Rover in container"
cd ..
go install