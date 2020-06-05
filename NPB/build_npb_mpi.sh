#! /bin/bash

CUR_DIR=$(cd "$(dirname "$0")";pwd)
cp $CUR_DIR/make.def.mpi $CUR_DIR/NPB3.3.1/NPB3.3-MPI/config/make.def

cd $CUR_DIR/NPB3.3.1/NPB3.3-MPI

DEFAULT_BUILD=$CUR_DIR/NPB3.3.1/NPB3.3-MPI/bin

BUILD=${CUR_DIR}/build
if [ ! -d ${BUILD} ]; then
    mkdir ${BUILD}
fi
BUILD_MPI=${BUILD}/mpi
if [ ! -d ${BUILD_MPI} ]; then
    mkdir ${BUILD_MPI}
fi


BUILD_LOG=$CUR_DIR/NPB3.3.1/NPB3.3-MPI/build_log
rm -rf $BUILD_LOG/
mkdir $BUILD_LOG/


bench_arr1=("lu" "cg" "mg" "ep" "ft" "is")
bench_arr2=("bt" "sp")
  
class=C

for bench in ${bench_arr1[@]}
do
  process=1
  echo "make $bench NPROCS=$process CLASS=$class"
  make $bench NPROCS=$process CLASS=$class  > $BUILD_LOG/make.$bench.$class.$process.log 2>&1
  cp $DEFAULT_BUILD/$bench.$class.$process $BUILD_MPI/$bench.$class.$process

  process=4
  echo "make $bench NPROCS=$process CLASS=$class"
  make $bench NPROCS=$process CLASS=$class  > $BUILD_LOG/make.$bench.$class.$process.log 2>&1
  cp $DEFAULT_BUILD/$bench.$class.$process $BUILD_MPI/$bench.$class.$process

  process=16
  echo "make $bench NPROCS=$process CLASS=$class"
  make $bench NPROCS=$process CLASS=$class  > $BUILD_LOG/make.$bench.$class.$process.log 2>&1
  cp $DEFAULT_BUILD/$bench.$class.$process $BUILD_MPI/$bench.$class.$process

  process=32
  echo "make $bench NPROCS=$process CLASS=$class"
  make $bench NPROCS=$process CLASS=$class  > $BUILD_LOG/make.$bench.$class.$process.log 2>&1
  cp $DEFAULT_BUILD/$bench.$class.$process $BUILD_MPI/$bench.$class.$process

  process=64
  echo "make $bench NPROCS=$process CLASS=$class"
  make $bench NPROCS=$process CLASS=$class  > $BUILD_LOG/make.$bench.$class.$process.log 2>&1
  cp $DEFAULT_BUILD/$bench.$class.$process $BUILD_MPI/$bench.$class.$process

  process=128
  echo "make $bench NPROCS=$process CLASS=$class"
  make $bench NPROCS=$process CLASS=$class  > $BUILD_LOG/make.$bench.$class.$process.log 2>&1
  cp $DEFAULT_BUILD/$bench.$class.$process $BUILD_MPI/$bench.$class.$process
done

for bench in ${bench_arr2[@]}
do
  process=1
  echo "make $bench NPROCS=$process CLASS=$class"
  make $bench NPROCS=$process CLASS=$class  > $BUILD_LOG/make.$bench.$class.$process.log 2>&1
  cp $DEFAULT_BUILD/$bench.$class.$process $BUILD_MPI/$bench.$class.$process

  process=4
  echo "make $bench NPROCS=$process CLASS=$class"
  make $bench NPROCS=$process CLASS=$class  > $BUILD_LOG/make.$bench.$class.$process.log 2>&1
  cp $DEFAULT_BUILD/$bench.$class.$process $BUILD_MPI/$bench.$class.$process

  process=16
  echo "make $bench NPROCS=$process CLASS=$class"
  make $bench NPROCS=$process CLASS=$class  > $BUILD_LOG/make.$bench.$class.$process.log 2>&1
  cp $DEFAULT_BUILD/$bench.$class.$process $BUILD_MPI/$bench.$class.$process

  process=36
  echo "make $bench NPROCS=$process CLASS=$class"
  make $bench NPROCS=$process CLASS=$class  > $BUILD_LOG/make.$bench.$class.$process.log 2>&1
  cp $DEFAULT_BUILD/$bench.$class.$process $BUILD_MPI/$bench.$class.$process

  process=64
  echo "make $bench NPROCS=$process CLASS=$class"
  make $bench NPROCS=$process CLASS=$class  > $BUILD_LOG/make.$bench.$class.$process.log 2>&1
  cp $DEFAULT_BUILD/$bench.$class.$process $BUILD_MPI/$bench.$class.$process

  process=121
  echo "make $bench NPROCS=$process CLASS=$class"
  make $bench NPROCS=$process CLASS=$class  > $BUILD_LOG/make.$bench.$class.$process.log 2>&1
  cp $DEFAULT_BUILD/$bench.$class.$process $BUILD_MPI/$bench.$class.$process
done