#! /bin/bash

CUR_DIR=$(cd "$(dirname "$0")";pwd)
cd $CUR_DIR

tar -jxvf sweep3d-2.2b.tar.bz2 
tar -jxvf input.tar.bz2

# $CUR_DIR/build.sh