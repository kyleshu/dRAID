#!/bin/bash

ip_addrs="$HOME/artifacts/ip_addrs_100g.txt"

let i=0

while read -u10 line
do
  if [[ $i -gt 0 ]]
  then
    echo "connect $line"
    sudo nvme disconnect -n "nqn.2016-06.io.spdk:cnode$i"
    echo "$line is READY!"
  else
    echo "skipping $line"
  fi
  let i+=1
done 10< $ip_addrs