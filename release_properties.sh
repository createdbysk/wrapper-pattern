function is_draft() {
    if [ "${BRANCH}" == "master" ]; then
        echo "false"
    else
        echo "true"
    fi
}

function is_prerelease() {
    if [ "${BRANCH}" == "master" ]; then
        echo "true"
    else
        echo "false"
    fi
}
