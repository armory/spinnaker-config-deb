#!/bin/bash

set -x
set -e

GIT_HASH=$(git rev-parse HEAD | cut -c -7)
BUILD_NUMBER=${BUILD_NUMBER:-0}
BRANCH_NAME=${BRANCH_NAME:-$GIT_HASH}

rm -rf build/

docker run --rm \
  -e "BUILD_NUMBER=${BUILD_NUMBER}" \
  -e "BRANCH_NAME=${BRANCH_NAME}" \
  -v $(pwd)/:/app/ \
  frekele/gradle:2.12-jdk8 \
  gradle --gradle-user-home /app/.gradle -b /app/build.gradle buildDeb
