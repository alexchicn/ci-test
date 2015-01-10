#/usr/bin/env bash

echo ">>> before deploy"

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

if [ "$DEPLOY_RELEASE"x = "true"x ]; then
  cd out
  mkdir demo
  cd demo
  cp ../bin/demo ./
  cp ../../README.md ./
  tar -czf demo.$TRAVIS_TAG.$TRAVIS_OS_NAME.tar.gz ./*
  cd ../..
else
  echo "< don't deploy anything >"
fi

echo "<<< before deploy"
