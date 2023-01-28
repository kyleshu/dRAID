# dRAID Implementation

## Contents

- `dRAID/` contains core implementation of dRAID and is adapted from SPDK.
  - `shared/` contains global variables and parameters shared by all code.
  - `host/` contains the host-side implementation.
    - `bdev_raid.h` & `bdev_raid.cc` contain the common controller logic shared by both RAID-5 and RAID-6.
    - `raid5.cc` contains core implementation of RAID-5 host controller.
    - `raid6.cc` contains core implementation of RAID-6 host controller.
    - `bdev_raid_rpc.cc` is for SPDK RPC framework integration
    - `rpc_raid_main.cc` is a HelloWorld program for dRAID for debugging purpose.
  - `server/` contains the server-side implementation.
    - `raid5.cc` contains core implementation of RAID-5 server controller.
    - `raid6.cc` contains core implementation of RAID-6 server controller.
    - `nvme0.json` is the configuration for NVMe SSD. Note: this PCIe address is hardcoded for CloudLab testbed. You probably need to change it if you use a different testbed.
    - `malloc0.json` is the configuration for RAM Disk.
  - `scripts/` contains scripts to run the HelloWorld program.

## Prerequisite

You must complete all the CloudLab setup steps under `setup` before you proceed to any FIO experiments.
If you want to run FIO or YCSB, you can skip the rest of the page. The corresponding scripts will compile the code for you.

## Compile

1. You only need to compile host-side code on the first node (node0). To compile the host-side code, run:
```Bash
cd ~/dRAID_ASPLOS23/dRAID/host (TODO)
make rpc_raid_main
```
2. You need to compile server-side code on all the nodes except the first (node0) and the last one (Ubuntu node). To compile the server-side code, run:
```Bash
cd ~/dRAID_ASPLOS23/dRAID/server (TODO)
make raid5
make raid6
```

## Run HelloWorld Program

This program uses RAM disk to verify dRAID read/write functionality. You will need the first 4 nodes of your testbed to run this program.

1. Start dRAID on remote targets by running the following command on node0:
```Bash
cd ~/dRAID_ASPLOS23/dRAID/scripts (TODO)
./run_server_remote_malloc.sh <your CloudLab username> raid5 100g 512 3 1 # enter yes when it prompts
```

2. Generate the host-side configuration file on node0:
```Bash
cd ~/dRAID_ASPLOS23/dRAID/scripts (TODO)
./generate_raid_config.sh 512 3 1
```
3. setup SPDK on node0:
```Bash
cd ~/draid-spdk/scripts
sudo ./setup.sh reset
sudo HUGEMEM=90000 PCI_BLOCKED="0000:c5:00.0 0000:c6:00.0" ./setup.sh
```

5. Run HelloWorld program on node0:
```Bash
cd ~/dRAID_ASPLOS23/dRAID/host (TODO)
sudo ./rpc_raid_main -c ~/artifacts/raid5_100g.json -b Raid0
```
Ignore the error message `io_device Raid0 not unregistered`. We have not implemented graceful shutdown yet.