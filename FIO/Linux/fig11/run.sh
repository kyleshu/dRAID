#!/bin/bash

chunk_size=$1

if [[ "$chunk_size" == "32" ]]
then
  sudo fio --directory=/raid/fiotest --size=8196M --time_based --runtime=15s --ramp_time=2s --ioengine=libaio --direct=1 --verify=0 --group_reporting=1 --name=randwrite --rw=randwrite --bs=128K --iodepth=10 --numjobs=1
  exit 0
fi

if [[ "$chunk_size" == "64" ]]
then
  sudo fio --directory=/raid/fiotest --size=8196M --time_based --runtime=15s --ramp_time=2s --ioengine=libaio --direct=1 --verify=0 --group_reporting=1 --name=randwrite --rw=randwrite --bs=128K --iodepth=9 --numjobs=1
  exit 0
fi

if [[ "$chunk_size" == "128" ]]
then
  sudo fio --directory=/raid/fiotest --size=8196M --time_based --runtime=15s --ramp_time=2s --ioengine=libaio --direct=1 --verify=0 --group_reporting=1 --name=randwrite --rw=randwrite --bs=128K --iodepth=8 --numjobs=1
  exit 0
fi

if [[ "$chunk_size" == "256" ]]
then
  sudo fio --directory=/raid/fiotest --size=8196M --time_based --runtime=15s --ramp_time=2s --ioengine=libaio --direct=1 --verify=0 --group_reporting=1 --name=randwrite --rw=randwrite --bs=128K --iodepth=8 --numjobs=1
  exit 0
fi

if [[ "$chunk_size" == "512" ]]
then
  sudo fio --directory=/raid/fiotest --size=128M --numjobs=1 --time_based --runtime=15s --ramp_time=2s --ioengine=libaio --direct=1 --verify=0 --rw=randwrite --group_reporting=1 --name=randwrite --bs=128K --iodepth=7
  exit 0
fi

if [[ "$chunk_size" == "1024" ]]
then
  sudo fio --directory=/raid/fiotest --size=8196M --time_based --runtime=15s --ramp_time=2s --ioengine=libaio --direct=1 --verify=0 --group_reporting=1 --name=randwrite --rw=randwrite --bs=128K --iodepth=8 --numjobs=1
  exit 0
fi

echo "We do not have a pre-written command for this chunk size. Feel free to run your own command."