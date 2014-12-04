#/usr/bin/env bash

echo ">>> install"

echo "-- TRAVIS_OS_NAME: $TRAVIS_OS_NAME"

# run command with exit error-code
set -e

if [ -z $TRAVIS_TAG ]; then
if [ "$RUN_COVERALLS"x = "true"x ]; then
#  sudo add-apt-repository --yes ppa:ubuntu-sdk-team/ppa
#  sudo apt-get update
#  sudo apt-get install aptitude
  echo "-- install cppcheck"
  sudo apt-get install cppcheck
  echo "-- install valgrind"
  sudo apt-get install valgrind
  echo "-- install gles1"
  sudo apt-get install libgles1-mesa-dev
  echo "-- install qt5"
  sudo apt-get install qt5-default
  echo "-- install coveralls"
  sudo pip install cpp-coveralls
  if [ "$CXX" == "g++" ]; then sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test; fi
  sudo apt-get update
  if [ "$CXX" = "g++" ]; then sudo apt-get install -qq g++-4.8; fi
  if [ "$CXX" = "g++" ]; then export CXX="g++-4.8" CC="gcc-4.8"; fi
  $CXX --version
  $CC --version
fi
else
  echo "! no install for coveralls"
fi

# test some applications
echo "-- cmake --version"
cmake --version
echo "-- ls qt"
ls -l /usr/include/ | grep qt
echo "-- ls gl"
ls -l /usr/include/ | grep GL
echo "-- moc -v"
moc -v
echo "-- uic -v"
uic -v
echo "-- valgrind --version"
valgrind --version
#echo "-- aptitude --version"
#aptitude --version
#echo "aptitude search gles"
#aptitude search GLES

echo "<<< install"
