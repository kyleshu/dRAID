# SPDK YCSB Experiments

If not specified, all the following operations are from node0, which servers as the host.

1. Start all remote targets by running:
```Bash
cd ~/dRAID/YCSB/SPDK
./run_nvmf_remote.sh ens1f0 # enter yes when it prompts
```


2. Setup SPDK on node0:
```Bash
cd ~/draid-spdk/scripts
sudo ./setup.sh reset
sudo HUGEMEM=90000 PCI_BLOCKED="0000:c5:00.0 0000:c6:00.0" ./setup.sh
```

3. Compile mkfs plugin for SPDK:
```Bash
cd ~/spdk/test/blobfs/mkfs
make mkfs
```

4. Prepare for YCSB:
```Bash
cd ~
mkdir -p data

cd ~/rocksdb
sudo make -j8 install-shared SPDK_DIR=../spdk
sudo ldconfig
cd ycsb
mkdir build
cd build
cmake ../
make -j