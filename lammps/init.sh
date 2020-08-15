#! /bin/bash

CUR_DIR=$(cd "$(dirname "$0")";pwd)
cd $CUR_DIR

wget https://github.com/lammps/lammps/archive/r15061.tar.gz
tar -zxvf r15061.tar.gz
rm r15061.tar.gz

$CUR_DIR/build.sh