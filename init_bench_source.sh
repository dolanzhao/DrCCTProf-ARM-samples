#! /bin/bash

CUR_DIR=$(cd "$(dirname "$0")";pwd)

cd $CUR_DIR
echo "Init gromacs"
./NPB/init.sh
echo "Init lulesh"
./lulesh/init.sh
echo "Init sweep3d"
./sweep3d/init.sh
echo "Init gromacs"
./gromacs/init.sh
echo "Init lammps"
./lammps/init.sh

echo "Init DrCCTProf tool"
./DrCCTProf/init.sh