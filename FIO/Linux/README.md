# Linux RAID FIO Experiments

If not specified, all the following operations are from the last node of your testbed, which is the Ubuntu node.

1. Start all remote targets by running:
```Bash
cd ~/dRAID_ASPLOS23/FIO/Linux (TODO)
./run_nvmf_remote.sh <your CloudLab username> ens1f0
```

2. Connect to all remote targets by running:
```Bash
cd ~/dRAID_ASPLOS23/FIO/Linux (TODO)
sudo nvme list # You should see 2 drives
./connect_nvmf.sh
sudo nvme list # number of drives should be equal to your testbed size
```

3. Follow the instruction of each experiment to reproduce the results.

4. Once you are done, disconnect from all remote targets by running:
```Bash
cd ~/dRAID_ASPLOS23/FIO/Linux (TODO)
./disconnect_nvmf.sh
```