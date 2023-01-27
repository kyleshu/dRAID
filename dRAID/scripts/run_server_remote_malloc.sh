#!/bin/bash

# ./run_server_remote_malloc.sh your_user_name raid5 100g 512 4 1

username=$1
raid_option=$2
network=$3
chunk=$4
raid_size=$5
num_qp=$6
hosts="$HOME/artifacts/hosts.txt"

let i=0

while read -u10 line
do
  if [[ $i -gt 0 ]] && [[ $i -le $raid_size ]]
  then
    echo "start $line"
    ssh -tt "$username@$line" "dRAID_ASPLOS23/dRAID/scripts/run_server_malloc.sh $raid_option $i $network $chunk $raid_size $num_qp"
    echo "$line is READY!"
  else
    echo "kill $line"
    ssh -tt "$username@$line" "dRAID_ASPLOS23/dRAID/scripts/kill_server.sh"
  fi
  let i+=1
done 10< $hosts