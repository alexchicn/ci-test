#/usr/bin/env bash

echo ">>> after success"

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

if [ "$RUN_COVERALLS"x = "true"x ]; then
  sudo ln -s /usr/bin/gcov-4.8 /usr/bin/gcov
  ./out/bin/demo
  coveralls --exclude build/ --gcov-options '\-lp'
else
  echo "! no run for coveralls"
fi

echo "<<< after success"
