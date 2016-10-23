#!/bin/bash

source tag.sh
docker build -t satvidh/wrapper-pattern:$(tag) package
