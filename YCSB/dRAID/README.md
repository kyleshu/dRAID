# dRAID YCSB Experiments

If not specified, all the following operations are from node0, which servers as the host. 

>Make sure you have successfully run HelloWorld program under `dRAID/` before you proceed.

1. Setup SPDK on node0:
```Bash
cd ~/draid-spdk/scripts
sudo ./setup.sh reset
sudo HUGEMEM=90000 PCI_BLOCKED="0000:c5:00.0 0000:c6:00.0" ./setup.sh
```

2. Compile mkfs plugin for dRAID:
```Bash
cd ~/dRAID/YCSB/dRAID
make mkfs
```

3. Prepare for YCSB:
```Bash
cd ~
mkdir -p data

cd ~/rocksdb
sudo make -j8 install-shared SPDK_DIR=../draid-spdk
sudo ldconfig
cd ycsb
mkdir build
cd build
cmake ../
make -j
```