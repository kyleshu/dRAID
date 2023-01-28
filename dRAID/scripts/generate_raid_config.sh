#!/bin/bash

chunk=$1
raid_size=$2
num_qp=$3

python3 create_raid_config.py $HOME/artifacts/ip_addrs_100g.txt $HOME/artifacts/raid5_100g.json $chunk 5 $raid_size $num_qp
python3 create_raid_config.py $HOME/artifacts/ip_addrs_100g.txt $HOME/artifacts/raid6_100g.json $chunk 6 $raid_size $num_qp
python3 create_raid_config.py $HOME/artifacts/ip_addrs_25g.txt $HOME/artifacts/raid5_25g.json $chunk 5 $raid_size $num_qp
python3 create_raid_config.py $HOME/artifacts/ip_addrs_25g.txt $HOME/artifacts/raid6_25g.json $chunk 6 $raid_size $num_qp