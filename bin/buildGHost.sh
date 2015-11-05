#!/bin/bash -ex

ROOT=$(pwd)/OHSystem-master

cd $ROOT/ghost/src/bncsutil/src/bncsutil/
make
make install

cd $ROOT/ghost/src/StormLib/stormlib
make
make install

cd $ROOT/ghost/src
make
