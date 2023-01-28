# Linux RAID - Figure 11

For each of the chunk size, run:
```Bash
cd ~/dRAID_ASPLOS23/FIO/Linux/fig11 (TODO)

./mount.sh <chunk_size_in_kb> # must be one of [32,64,128,256,512,1024]
# enter y when it prompts 

./run.sh <chunk_size_in_kb> # must be one of [32,64,128,256,512,1024]

./unmount.sh
```