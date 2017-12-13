#!/bin/bash

cd "$(dirname "$0")/.."

set -x
set -e

GIT_HASH=$(git rev-parse HEAD | cut -c -7)
BUILD_NUMBER=${BUILD_NUMBER:-0}
BRANCH_NAME=${BRANCH_NAME:-$GIT_HASH}

rm -rf build/

BUILD_NUMBER="${BUILD_NUMBER}" BRANCH_NAME="${BRANCH_NAME}" \
./gradlew buildDeb  # builds to build/distributions/*.deb
# ./gradlew buildRpm  # builds to build/distributions/*.rpm
