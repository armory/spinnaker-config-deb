#!/bin/bash

cd "$(dirname "$0")/.."
set -e


# Example using Bintray
##########################
BINTRAY_REPO="armory/internal/spinnaker-config-deb-example" # your repo here
# BINTRAY_USER=
# BINTRAY_APIKEY=


BINTRAY_URL="https://api.bintray.com/content/${BINTRAY_REPO}/debians"
APP_NAME="spinnaker-config"
DEB_FILE=$(ls build/distributions/*.deb)
VERSION=$(echo "${DEB_FILE}" | cut -d _ -f 2)
METADATA="deb_distribution=trusty;deb_component=main;publish=1;deb_architecture=i386,amd64"

curl -T ${DEB_FILE} \
  -u${BINTRAY_USER}:${BINTRAY_APIKEY} \
   "${BINTRAY_URL}/${APP_NAME}/${VERSION}/${DEB_FILE};${METADATA}"





# Example using s3 bucket
##########################
AWS_ACCESS_KEY=${AWS_ACCESS_KEY:-"AWS_ACCESS_KEY_DEFAULT"}
AWS_SECRET_KEY=${AWS_SECRET_KEY:-"AWS_SECRET_KEY_DEFAULT"}
S3_REGION=${S3_REGION:-"us-east-1"}
S3_PREFIX=${S3_PREFIX:-"spinnaker-config-deb-example"}
S3_BUCKET=${S3_BUCKET:-"armory-dev-multipurpose"}

# use deb-s3 as our uploader
docker build -f Dockerfile.deb-s3 -t deb-s3 .

docker run --rm --name=spinnaker-config-deb-s3 \
  -v "$(pwd)/build/:/home/deb-s3/build/" \
  deb-s3 upload \
  --access-key-id=${AWS_ACCESS_KEY} \
  --secret-access-key=${AWS_SECRET_KEY} \
  --visibility=private \
  --encryption \
  --lock --fail-if-exists \
  --prefix=${S3_PREFIX} \
  --bucket ${S3_BUCKET} \
  --s3-region=${S3_REGION} \
  --arch amd64,i386 \
  $(ls build/distributions/*.deb)

# This will store your package in the repository:
# https://s3-us-east-1.amazonaws.com/armory-dev-multipurpose/spinnaker-config-deb-example stable main
