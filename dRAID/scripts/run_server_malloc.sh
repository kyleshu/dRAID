#!/bin/bash

raid_option=$1
i=$2
network=$3
chunk=$4
raid_size=$5
num_qp=$6

sudo kill -9 $(ps aux | grep '[i]p_addrs_' | awk '{print $2}')
sudo kill -9 $(ps aux | grep '[n]vmf_tgt' | awk '{print $2}')

sudo rm /dev/shm/*

cd ~/draid-spdk
sudo ./scripts/setup.sh reset
sudo HUGEMEM=10240 PCI_ALLOWED="0000:c6:00.0" ./scripts/setup.sh

cd ~/dRAID_ASPLOS23/dRAID/server
sudo rm nohup.out
make clean
make "$raid_option"

sudo sh -c "nohup ./$raid_option -P $i -b Malloc0 -c malloc0.json -m 0x10000 -a $HOME/artifacts/ip_addrs_$network.txt -S $chunk -N $raid_size -E $num_qp > /dev/null 2>&1 &"