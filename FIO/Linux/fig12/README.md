# Linux RAID - Figure 12

For each of the stripe width, run:
```Bash
cd ~/dRAID_ASPLOS23/FIO/Linux/fig12 (TODO)

./mount.sh <stripe_width> # must be one of [4,6,8,10,12,14,16,18]
# enter y when it prompts 

./run.sh <stripe_width> # must be one of [4,6,8,10,12,14,16,18]

./unmount.sh <stripe_width> # must be one of [4,6,8,10,12,14,16,18]
```