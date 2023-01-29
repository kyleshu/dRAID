# SPDK FIO Experiments

If not specified, all the following operations are from node0, which servers as the host.

1. Start all remote targets by running:
```Bash
cd ~/dRAID_ASPLOS23/FIO/SPDK (TODO)
./run_nvmf_remote.sh <your CloudLab username> ens1f0 # enter yes when it prompts
```

2. Setup SPDK on node0:
```Bash
cd ~/draid-spdk/scripts
sudo ./setup.sh reset
sudo HUGEMEM=90000 PCI_BLOCKED="0000:c5:00.0 0000:c6:00.0" ./setup.sh
```

3. Follow the instruction of each experiment to reproduce the results.