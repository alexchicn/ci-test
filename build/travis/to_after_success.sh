#/user/bin/env bash

echo ">>> after success"

if [ -z $TRAVIS_TAG ]; then
if [ "$RUN_COVERALLS"x = "true"x ]; then
  ./out/bin/demo
  coveralls --exclude build/ --gcov-options '\-lp'
fi
else
  echo "! no run for coveralls"
fi

echo "<<< after success"
