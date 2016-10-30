function docker_tag() {
    local TAG=${BRANCH}
    if [ "${TAG}" == "master" ]; then
        TAG=latest
    fi
    echo ${TAG}
}
