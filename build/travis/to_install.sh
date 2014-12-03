#/usr/bin/env bash

echo ">>> install"

echo "-- TRAVIS_OS_NAME: $TRAVIS_OS_NAME"

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
  echo "-- install gcc"
  sudo apt-get install gcc
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
