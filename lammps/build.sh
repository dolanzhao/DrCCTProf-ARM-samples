#! /bin/bash

CUR_DIR=$(cd "$(dirname "$0")";pwd)

cd $CUR_DIR/lammps-r15061/src
make mpi