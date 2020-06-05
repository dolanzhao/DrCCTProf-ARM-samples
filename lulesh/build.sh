#! /bin/bash

CUR_DIR=$(cd "$(dirname "$0")";pwd)
SRC=${CUR_DIR}/lulesh
BUILD=${CUR_DIR}/build
if [ ! -d ${BUILD} ]; then
    mkdir ${BUILD}
fi

LULESH=${BUILD}/lulesh-par-original
LULESH_REUSE=${BUILD}/lulesh-par-reuse
echo -e "Build Lulesh1.0.."
g++ -g -O3 -fopenmp ${SRC}/luleshOMP-0611.cc ${SRC}/instrument.cc -DPOLYBENCH_TIME -o ${LULESH}
g++ -g -O3 -fopenmp ${SRC}/luleshOMP-0611.reuse.cc ${SRC}/instrument.cc -DPOLYBENCH_TIME -o ${LULESH_REUSE}
echo -e "Success build Lulesh1.0.."
