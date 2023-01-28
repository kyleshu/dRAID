#!/bin/bash

chunk_size=$1

if [[ "$chunk_size" == "32" ]]
then
  sudo mdadm --create -v /dev/md0 --assume-clean --chunk=32 --level=5 --raid-devices=8 --size=134217728 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1 /dev/nvme5n1 /dev/nvme6n1 /dev/nvme7n1 /dev/nvme8n1 /dev/nvme9n1
  sudo mkfs -t ext4 /dev/md0
  sudo mount /dev/md0 /raid
  sudo mkdir /raid/fiotest
  exit 0
fi

if [[ "$chunk_size" == "64" ]]
then
  sudo mdadm --create -v /dev/md0 --assume-clean --chunk=64 --level=5 --raid-devices=8 --size=134217728 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1 /dev/nvme5n1 /dev/nvme6n1 /dev/nvme7n1 /dev/nvme8n1 /dev/nvme9n1
  sudo mkfs -t ext4 /dev/md0
  sudo mount /dev/md0 /raid
  sudo mkdir /raid/fiotest
  exit 0
fi

if [[ "$chunk_size" == "128" ]]
then
  sudo mdadm --create -v /dev/md0 --assume-clean --chunk=128 --level=5 --raid-devices=8 --size=134217728 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1 /dev/nvme5n1 /dev/nvme6n1 /dev/nvme7n1 /dev/nvme8n1 /dev/nvme9n1
  sudo mkfs -t ext4 /dev/md0
  sudo mount /dev/md0 /raid
  sudo mkdir /raid/fiotest
  exit 0
fi

if [[ "$chunk_size" == "256" ]]
then
  sudo mdadm --create -v /dev/md0 --assume-clean --chunk=256 --level=5 --raid-devices=8 --size=134217728 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1 /dev/nvme5n1 /dev/nvme6n1 /dev/nvme7n1 /dev/nvme8n1 /dev/nvme9n1
  sudo mkfs -t ext4 /dev/md0
  sudo mount /dev/md0 /raid
  sudo mkdir /raid/fiotest
  exit 0
fi

if [[ "$chunk_size" == "512" ]]
then
  sudo mdadm --create -v /dev/md0 --assume-clean --chunk=512 --level=5 --raid-devices=8 --size=134217728 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1 /dev/nvme5n1 /dev/nvme6n1 /dev/nvme7n1 /dev/nvme8n1 /dev/nvme9n1
  sudo mkfs -t ext4 /dev/md0
  sudo mount /dev/md0 /raid
  sudo mkdir /raid/fiotest
  exit 0
fi

if [[ "$chunk_size" == "1024" ]]
then
  sudo mdadm --create -v /dev/md0 --assume-clean --chunk=1024 --level=5 --raid-devices=8 --size=134217728 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1 /dev/nvme5n1 /dev/nvme6n1 /dev/nvme7n1 /dev/nvme8n1 /dev/nvme9n1
  sudo mkfs -t ext4 /dev/md0
  sudo mount /dev/md0 /raid
  sudo mkdir /raid/fiotest
  exit 0
fi

echo "We do not have a pre-written command for this chunk size. Feel free to run your own command."