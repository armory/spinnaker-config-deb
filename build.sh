#!/bin/bash

set -x

GIT_HASH=$(git rev-parse HEAD | cut -c -7)
BUILD_NUMBER=${BUILD_NUMBER:-0}
BRANCH_NAME=${BRANCH_NAME:-$GIT_HASH}

docker run --rm \
  -e "BUILD_NUMBER=${BUILD_NUMBER}" \
  -e "BRANCH_NAME=${BRANCH_NAME}" \
  -v $(pwd)/:/app/ \
  frekele/gradle:2.12-jdk8 \
  gradle -b /app/build.gradle buildDeb
