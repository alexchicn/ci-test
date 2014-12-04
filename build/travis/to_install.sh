#/usr/bin/env bash

echo ">>> install"

echo "-- TRAVIS_OS_NAME: $TRAVIS_OS_NAME"

# run command with exit error-code
set -e

if [ -z $TRAVIS_TAG ]; then
if [ "$RUN_COVERALLS"x = "true"x ]; then
  if [ "$CXX" == "g++" ]; then sudo add-apt-repository --yes ppa:ubuntu-toolchain-r/test; fi
  sudo add-apt-repository --yes ppa:ubuntu-sdk-team/ppa
  sudo apt-get update -qq
  if [ "$CXX" = "g++" ]; then sudo apt-get install -qq g++-4.8; fi
  if [ "$CXX" = "g++" ]; then export CXX="g++-4.8" CC="gcc-4.8"; fi
  $CXX --version
  $CC --version
#  sudo apt-get install aptitude
  #echo "-- install cppcheck valgrind coveralls"
  #sudo apt-get install cppcheck valgrind cpp-coveralls
  #echo "-- install gles1"
  #sudo apt-get install libgles1-mesa-dev
  #echo "-- install qt5"
  #sudo apt-get install qt5-default
fi
else
  echo "! no install for coveralls"
  exit
fi

# test some applications
echo "-- cmake --version"
cmake --version
#echo "-- ls qt"
#ls -l /usr/include/ | grep qt
#echo "-- ls gl"
#ls -l /usr/include/ | grep GL
#echo "-- moc -v"
#moc -v
#echo "-- uic -v"
#uic -v
#echo "-- valgrind --version"
#valgrind --version
#echo "-- aptitude --version"
#aptitude --version
#echo "aptitude search gles"
#aptitude search GLES

echo "<<< install"
