#!/bin/bash

source tag.sh
docker build -t satvidh/wrapper-pattern:$(docker_tag) package

tar -cpvzf ${BUILD_DIR}/${ARCHIVE}  \
    package
