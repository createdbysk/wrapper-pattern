#!/bin/bash

docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
source tag.sh
docker push satvidh/wrapper-pattern:$(docker_tag)
docker logout

source release_properties.sh
source .build.conf

IS_DRAFT=$(is_draft)
IS_PRERELEASE=$(is_prerelease)
RELEASE_PROPERTIES_FILE=${BUILD_DIR}/git_release.json

cat > ${RELEASE_PROPERTIES_FILE} <<EOF
{
    "tag_name": "${VERSION}",
    "target_commitish": "${BRANCH}",
    "name": "${NAME}",
    "body": "${DESCRIPTION}",
    "draft": ${IS_DRAFT},
    "prerelease": ${IS_PRERELEASE}
}
EOF

TEMP_RESULT=$(mktemp)

STATUS=$(curl -w "%{http_code}" -o ${TEMP_RESULT} -H "Authorization: token ${GITHUB_TOKEN}" \
        -X POST -d @${RELEASE_PROPERTIES_FILE} \
        https://api.github.com/repos/satvidh/${NAME}/releases)

RESULT=$?
if [ ${RESULT} -ne 0 ]; then
    echo "Release failed."
    exit 1
fi

if [ ${STATUS} -eq 201 ]; then
    ID=$(cat ${TEMP_RESULT} | jq -r '.id')
    UPLOAD_URL=https://uploads.github.com/repos/satvidh/${NAME}/releases/${ID}/assets
    curl -H "Authorization: token ${GITHUB_TOKEN}" \
        -H "Content-Type:application/x-gtar" \
        -X POST -d @${BUILD_DIR}/${ARCHIVE} \
        ${UPLOAD_URL}?name=${ARCHIVE}
fi

rm ${TEMP_RESULT}
