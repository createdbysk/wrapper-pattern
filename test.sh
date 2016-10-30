#!/bin/bash

source tag.sh
docker run --rm satvidh/wrapper-pattern:$(docker_tag)
