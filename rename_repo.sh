#!/usr/bin/env bash


NAME_SOURCE="prismatic-package"
NAME_DEST="pydantic-persitence"

GITHUB_SOURCE="/prismaticd/prismatic-package"
GITHUB_DEST="/prismaticd/pydantic-persitence"

PACKAGE_FOLDER_SOURCE="prismatic_package"
PACKAGE_FOLDER_DEST="pydantic_persitence"

VERSION_REPLACE=$(awk -F "=" '/version/ {print $2}' pyproject.toml | tr -d ' ' | tr -d '"' | head -1)
START_VERSION="0.0.1"

mv ${PACKAGE_FOLDER_SOURCE} ${PACKAGE_FOLDER_DEST}
mv tests/test_${PACKAGE_FOLDER_SOURCE}.py tests/test_${PACKAGE_FOLDER_DEST}.py

find ./ -type f | grep -v rename_repo.sh | grep -v .git/ | xargs sed -i "s#${GITHUB_SOURCE}#${GITHUB_DEST}#g";
find ./ -type f | grep -v rename_repo.sh | grep -v .git/ | xargs sed -i "s#${NAME_SOURCE}#${NAME_DEST}#g";
find ./ -type f | grep -v rename_repo.sh | grep -v .git/| xargs sed -i "s#${PACKAGE_FOLDER_SOURCE}#${PACKAGE_FOLDER_DEST}#g";
