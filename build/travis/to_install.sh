#/usr/bin/env bash

echo ">>> install"

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

if [ "$CXX" == "g++" ]; then sudo add-apt-repository --yes ppa:ubuntu-toolchain-r/test; fi
sudo add-apt-repository --yes ppa:ubuntu-sdk-team/ppa
sudo apt-get update -qq
if [ "$CXX" = "g++" ]; then sudo apt-get install -qq g++-4.8; fi
if [ "$CXX" = "g++" ]; then export CXX="g++-4.8" CC="gcc-4.8"; fi
$CXX --version
$CC --version
#sudo apt-get install aptitude
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

# test some applications
echo "-- cmake --version"
cmake --version
echo "-- ls qt"
ls -l /usr/include/ | grep qt
echo "-- ls gl"
ls -l /usr/include/ | grep GL
#echo "-- moc -v"
#moc -v
#echo "-- uic -v"
#uic -v
echo "-- valgrind --version"
valgrind --version
#echo "-- aptitude --version"
#aptitude --version
#echo "aptitude search gles"
#aptitude search GLES

echo "<<< install"
