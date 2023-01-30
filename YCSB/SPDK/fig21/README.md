# SPDk - Figure 21

1. Generate the host-side configuration file on node0:
```Bash
cd ~/dRAID/FIO/SPDK/fig21
../generate_raid_config.sh 512 8 1
```

2. For each workload, run:
```Bash
cd ~/dRAID/YCSB/SPDK/fig21

./run.sh <workload> # must be one of [A,B,C,D,F]
```