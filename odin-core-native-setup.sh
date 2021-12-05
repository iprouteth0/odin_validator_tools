#! /bin/bash

# update the local package list and install any available upgrades
sudo apt-get update && sudo apt upgrade
# install toolchain and ensure accurate time synchronization
sudo apt-get install make build-essential gcc git jq chrony
wget https://golang.org/dl/go1.17.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.17.3.linux-amd64.tar.gz

cat <<EOF >> ~/.profile
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GO111MODULE=on
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
EOF
source ~/.profile
#go version
#echo "export GOROOT=/usr/local/go
#export GOPATH=${HOME}/go
#export GOBIN=${GOPATH}/bin
#export PATH=${PATH}:${GOROOT}/bin:${GOBIN}
#" >> ~/.bashrc
#source ~/.bashrc
git clone https://github.com/GeoDB-Limited/odin-core.git
cd odin-core
git fetch --tags
git checkout v0.1.0
make all
