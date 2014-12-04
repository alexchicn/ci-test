#/usr/bin/env bash

# run command with exit error-code
set -e

mkdir out
cd out
mkdir make
cd make

if [ -z $TRAVIS_TAG ]; then
if [ "$RUN_COVERALLS"x = "true"x ]; then
  cmake -D USE_COVERALLS=TRUE ../../build/cmake
fi
elif [ "$DEPLOY_RELEASE"x = "true"x ]; then
  cmake ../../build/cmake
fi

if [ "$CXX" = "g++" ]; then sudo apt-get install -qq g++-4.8; fi
if [ "$CXX" = "g++" ]; then export CXX="g++-4.8" CC="gcc-4.8"; fi

$CXX --version
$CC --version

make

cd ../..

