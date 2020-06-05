#! /bin/bash
CUR_DIR=$(cd "$(dirname "$0")";pwd)

cd $CUR_DIR
wget https://www.nas.nasa.gov/assets/npb/NPB3.3.1.tar.gz
tar -zxvf NPB3.3.1.tar.gz
rm $CUR_DIR/NPB3.3.1.tar.gz

$CUR_DIR/build_npb_mpi.sh
$CUR_DIR/build_npb_omp.sh
