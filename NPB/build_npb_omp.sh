#! /bin/bash

CUR_DIR=$(cd "$(dirname "$0")";pwd)
cp $CUR_DIR/make.def.omp $CUR_DIR/NPB3.3.1/NPB3.3-OMP/config/make.def

cd $CUR_DIR/NPB3.3.1/NPB3.3-OMP

DEFAULT_BUILD=$CUR_DIR/NPB3.3.1/NPB3.3-OMP/bin

BUILD=${CUR_DIR}/build
if [ ! -d ${BUILD} ]; then
    mkdir ${BUILD}
fi
BUILD_MPI=${BUILD}/omp
if [ ! -d ${BUILD_MPI} ]; then
    mkdir ${BUILD_MPI}
fi

BUILD_LOG=$CUR_DIR/NPB3.3.1/NPB3.3-OMP/build_log
rm -rf $BUILD_LOG/
mkdir $BUILD_LOG/


bench_arr1=("lu" "cg" "mg" "ep" "ft" "is")
bench_arr2=("bt" "sp")
  
class=C

for bench in ${bench_arr1[@]}
do
  echo "make $bench CLASS=$class"
  make $bench CLASS=$class  > $BUILD_LOG/make.$bench.$class.x.log 2>&1
  cp $DEFAULT_BUILD/$bench.$class.x $BUILD_MPI/$bench.$class.x
done

for bench in ${bench_arr2[@]}
do
  echo "make $bench CLASS=$class"
  make $bench CLASS=$class  > $BUILD_LOG/make.$bench.$class.x.log 2>&1
  cp $DEFAULT_BUILD/$bench.$class.x $BUILD_MPI/$bench.$class.x
done
