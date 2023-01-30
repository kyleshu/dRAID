# SPDK - Figure 20

1. Generate the host-side configuration file on node0:
```Bash
cd ~/dRAID/FIO/SPDK/fig20
../generate_raid_config.sh 512 8 1
```

2. For each workload, run:
```Bash
cd ~/dRAID/YCSB/SPDK/fig20

./run.sh <workload> # must be one of [A,B,C,D,F]
```