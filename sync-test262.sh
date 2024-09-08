#!/usr/bin/env bash
TEST262_SOURCE_DIR="${TEST262_SOURCE_DIR:-test262}"

log() {
    echo -e "\033[0;34m[${1}]\033[0m ${2}"
}

if [[ -d "${TEST262_SOURCE_DIR}" ]]; then
    log test262 "Updating test262 directory"

    pushd "${TEST262_SOURCE_DIR}"
        git pull
    popd
else
    log test262 "test262 directory not found, cloning repository"
    git clone --depth 1 https://github.com/tc39/test262.git
fi
