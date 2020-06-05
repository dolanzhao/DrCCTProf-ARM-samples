#! /bin/bash

CUR_DIR=$(cd "$(dirname "$0")";pwd)

cd $CUR_DIR
wget https://github.com/gromacs/gromacs/archive/v2016.5.tar.gz
tar -zxvf v2016.5.tar.gz
rm v2016.5.tar.gz

mkdir bench
cd $CUR_DIR/bench
wget https://ftp.gromacs.org/pub/benchmarks/ADH_bench_systems.tar.gz
tar -zxvf ADH_bench_systems.tar.gz
rm ADH_bench_systems.tar.gz

$CUR_DIR/build.sh