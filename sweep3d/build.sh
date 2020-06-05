#! /bin/bash
CUR_DIR=$(cd "$(dirname "$0")";pwd)
SRC=${CUR_DIR}/sweep3d-2.2b

BUILD=${CUR_DIR}/build
if [ ! -d ${BUILD} ]; then
    mkdir ${BUILD}
fi
BUILD_ORI=${BUILD}/ori
BUILD_REUSE=${BUILD}/reuse


cp -r $SRC $BUILD_ORI
cp $BUILD_ORI/sweep.f.orig $BUILD_ORI/sweep.f
cd $BUILD_ORI
./configure  F77=mpif90 --prefix=$BUILD_ORI/install --with-mpi
make
make install

cp -r $SRC $BUILD_REUSE
cp $BUILD_REUSE/sweep.f.op.locality $BUILD_REUSE/sweep.f
cd $BUILD_REUSE
./configure  F77=mpif90 --prefix=$BUILD_REUSE/install --with-mpi
make
make install