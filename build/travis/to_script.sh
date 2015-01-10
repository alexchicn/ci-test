#/usr/bin/env bash

echo ">>> script"

if [ "$TRAVIS_TAG" ]; then
if [ "$DEPLOY_RELEASE"x = "true"x ]; then
  VALID=ok
fi
else
if [ "$RUN_COVERALLS"x = "true"x ]; then
  VALID=ok
fi
fi

if [ "$VALID"x != "ok"x ]; then
  exit
fi

# run command with exit error-code
set -e

mkdir out
cd out
mkdir make
cd make

if [ "$CXX" = "g++" ]; then sudo apt-get install -qq g++-4.8; fi
if [ "$CXX" = "g++" ]; then export CXX="g++-4.8" CC="gcc-4.8"; fi

if [ -z $TRAVIS_TAG ]; then
if [ "$RUN_COVERALLS"x = "true"x ]; then
  cmake -D USE_COVERALLS=TRUE ../../build/cmake
fi
elif [ "$DEPLOY_RELEASE"x = "true"x ]; then
  cmake ../../build/cmake
fi

$CXX --version
$CC --version

make

cd ../..
