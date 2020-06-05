#! /bin/bash

CUR_DIR=$(cd "$(dirname "$0")";pwd)

# Please use 
DRRUN=$CUR_DIR/DrCCTProf/DrCCTProf-1.0.0/build/bin64/drrun

# OMP Example
# lulesh 32 OMP threads
APP_EXE=$CUR_DIR/lulesh/build/lulesh-par-original
APP_ARG=5
export OMP_NUM_THREADS=32
export GOMP_CPU_AFFINITY="0-63"
# code centric base client
CLIENT_NAME="drcctlib_all_instr_cct"
$DRRUN -unsafe_build_ldstex -t $CLIENT_NAME -- $APP_EXE $APP_ARG
# data centric base client
CLIENT_NAME="drcctlib_all_instr_cct_with_data_centric"
$DRRUN -unsafe_build_ldstex -t $CLIENT_NAME -- $APP_EXE $APP_ARG


# MPI Example
# lammps 32 MPI processes
APP_EXE=$CUR_DIR/lammps/lammps-r15061/src/lmp_mpi
# code centric base client
CLIENT_NAME="drcctlib_all_instr_cct"
mpirun -np 32 $DRRUN -unsafe_build_ldstex -t $CLIENT_NAME -- $APP_EXE -var x 2 -var y 2 -var z 2 -in $CUR_DIR/lammps/lammps-r15061/bench/in.lj
# data centric base client
CLIENT_NAME="drcctlib_all_instr_cct_with_data_centric"
mpirun -np 32 $DRRUN -unsafe_build_ldstex -t $CLIENT_NAME -- $APP_EXE -var x 2 -var y 2 -var z 2 -in $CUR_DIR/lammps/lammps-r15061/bench/in.lj