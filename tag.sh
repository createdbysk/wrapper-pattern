function tag() {
    local TAG=${TRAVIS_BRANCH}
    if [ "${TAG}" == "master" ]; then
        TAG=latest
    fi
    echo ${TAG}
}
