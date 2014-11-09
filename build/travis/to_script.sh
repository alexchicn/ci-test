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

make

cd ../..

