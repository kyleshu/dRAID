# YCSB Experiments

- `dRAID/` contains scripts for running YCSB on dRAID.
- `SPDK/` contains scripts for running YCSB on SPDK.

## Prerequisite

1. Clone rocksdb repo:
```Bash
git clone https://github.com/kyleshu/rocksdb.git
cd rocksdb
```

2. Choose the application you want to run.

If you want to run rocksdb:

```Bash
git checkout rocksdb 
```

If you want to run object store:
```Bash
git checkout objstore 
```

Also remember choose corresponding source file in spdk(SPDK_DIR/lib/rocksdb/env_spdk.cc):
```Bash
cp SPDK_DIR/lib/rocksdb/env_spdk_rocksdb.cc SPDK_DIR/lib/rocksdb/env_spdk.cc
```

or 

```Bash
cp SPDK_DIR/lib/rocksdb/env_spdk_objstore.cc SPDK_DIR/lib/rocksdb/env_spdk.cc
```


You must complete all the CloudLab setup steps under `setup` before you proceed to any YCSB experiments.