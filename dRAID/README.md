# dRAID Implementation

## Contents

- `dRAID/` contains core implementation of dRAID and is adapted from SPDK.
  - `shared/` contains global variables and parameters shared by all code.
  - `host/` contains the host-side implementation.
    - `bdev_raid.h` & `bdev_raid.cc` contain the common controller logic shared by both RAID-5 and RAID-6.
    - `raid5.cc` contains core implementation of RAID-5 host controller.
    - `raid6.cc` contains core implementation of RAID-6 host controller.
    - `bdev_raid_rpc.cc` is for SPDK RPC framework integration
    - `rpc_raid_main.cc` is a hello-world program for dRAID for debugging purpose.
  - `server/` contains the server-side implementation.
    - `raid5.cc` contains core implementation of RAID-5 server controller.
    - `raid6.cc` contains core implementation of RAID-6 server controller.
    - `nvme0.json` is the configuration for NVMe SSD. Note: this PCIe address is hardcoded for CloudLab testbed. You probably need to change it if you use a different testbed.
    - `malloc0.json` is the configuration for RAM Disk.

## Compile
If you want to run FIO or YCSB, you can skip this. The corresponding scripts will do this for you.

1. To compile host-side code, run:
```Bash
cd host
make rpc_raid_main
```
2. To compile server-side code, run:
```Bash
cd server
make raid5
make raid6
```