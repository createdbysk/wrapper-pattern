#!/bin/bash

docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
source tag.sh
docker push satvidh/wrapper-pattern:$(tag)
docker logout
