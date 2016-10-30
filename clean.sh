#!/bin/bash

source tag.sh
docker rmi satvidh/wrapper-pattern:$(docker_tag)
rm -rf ${BUILD_DIR}
