#!/bin/bash -ex

CWD=$(pwd)

cd $CWD/ghost/bncsutil/src/bncsutil/
make
make install

cd $CWD/ghost/StormLib/stormlib
make
make install

cd $CWD/ghost/ghost
find . -name "*.cpp" -print | xargs sed -i 's/i->filename( );/i->path( ).filename( ).string( );/g'
find . -name "*.cpp" -print | xargs sed -i 's/LastMatch.filename( );/LastMatch.filename( ).string( );/g'
find . -name "*.cpp" -print | xargs sed -i 's/i->path( ).stem( );/i->path( ).stem( ).string( );/g'
sed -i 's/-mt//g' Makefile
sed -i 's/-lboost_filesystem/-lboost_filesystem -lgmp/' Makefile
make
