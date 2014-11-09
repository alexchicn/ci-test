echo ">>> befor deploy"

if [ -n $TRAVIS_TAG ]; then 
if [ "$DEPLOY_RELEASE"x = "true"x ]; then
  cd out
  mkdir demo
  cd demo
  cp ../bin/demo ./
  cp ../../README.md ./
  tar -czf demo.$TRAVIS_TAG.$TRAVIS_OS_NAME.tar.gz ./*
  cd ../..
fi
else
  echo "! don't package anything"
fi

echo "<<< before deploy"
