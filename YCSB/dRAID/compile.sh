#!/bin/bash

# compile mkfs
cd ~/dRAID/YCSB/dRAID
make mkfs

#prepare for YCSB
cd ~
mkdir -p data

cd ~/rocksdb
sudo make -j8 install-shared SPDK_DIR=../draid-spdk
sudo ldconfig
cd ycsb
mkdir -p build
cd build
cmake ../
make -j
