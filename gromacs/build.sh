#! /bin/bash

CUR_DIR=$(cd "$(dirname "$0")";pwd)
SRC=${CUR_DIR}/gromacs-2016.5
BUILD=${CUR_DIR}/build
if [ ! -d ${BUILD} ]; then
    mkdir ${BUILD}
fi

cd $BUILD
cmake $SRC -DGMX_BUILD_OWN_FFTW=ON -DREGRESSIONTEST_DOWNLOAD=ON -DGMX_MPI=ON
make -j CFLAGS=-fPIC
make check
sudo make install
source /usr/local/gromacs/bin/GMXRC