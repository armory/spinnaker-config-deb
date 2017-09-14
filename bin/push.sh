#!/bin/bash

set -e

BINTRAY_REPO=""	# your repo here
# BINTRAY_USER=
# BINTRAY_APIKEY=


BINTRAY_URL="https://api.bintray.com/content/${BINTRAY_REPO}/debians"
APP_NAME="spinnaker-config"
DEB_FILE=$(ls build/distributions/*.deb)
VERSION=$(echo "${DEB_FILE}" | cut -d _ -f 2)
METADATA="deb_distribution=trusty;deb_component=main;publish=1;deb_architecture=i386,amd64"

echo "RUNNING IN DEBUG MODE! not pushing"
echo curl -T ${DEB_FILE} \
  -u${BINTRAY_USER}:${BINTRAY_APIKEY} \
   "${BINTRAY_URL}/${APP_NAME}/${VERSION}/${DEB_FILE};${METADATA}"
