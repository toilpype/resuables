#!/bin/bash
### This script downloads and builds cmake.
### If it fails, please refer to the following offical installation guide:
### https://docs.opencv.org/4.x/d7/d9f/tutorial_linux_install.html

set -e
trap "echo '[ERROR] install failed!' >&2" ERR
# Check arguments
if [ $# -ne 1 ]; then
    echo "Provide 1 argument: a directory to download and build opencv. (ex: ~/Downloads)"
    exit 1
fi
donwload_dir=$1
cd $donwload_dir

# Prerequisites
sudo apt update && sudo apt install -y gcc g++ build-essential libssl-dev

# Download, unpack, and build
wget https://github.com/Kitware/CMake/releases/download/v3.26.3/cmake-3.26.3.tar.gz
tar -zxvf cmake-3.26.3.tar.gz
cd cmake-3.26.3
./bootstrap
make
sudo make install
cd ..
rm -rf cmake-3.26.3 cmake-3.26.3.tar.gz
