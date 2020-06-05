#! /bin/bash

CUR_DIR=$(cd "$(dirname "$0")";pwd)

cd $CUR_DIR
tar -jxvf lulesh.tar.bz2

$CUR_DIR/build.sh
