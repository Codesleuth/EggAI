#!/usr/bin/env bash

set -e

# get the current directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

qualops all --base downstream/main --head 40967a188a73bd8e4be9d99f629c1088f9f0ffbf --stages analyze,review,report --files "$DIR/../sdk/**/*.py"

export GITHUB_TOKEN=$GITHUB_API_KEY
export GITHUB_REPOSITORY='Codesleuth/EggAI'
export GITHUB_EVENT_PATH="$DIR/pull_request_event.json"
export GITHUB_EVENT_NAME='pull_request'
export GITHUB_SHA='40967a188a73bd8e4be9d99f629c1088f9f0ffbf'
# export GITHUB_HEAD_REF=''
# export GITHUB_BASE_REF=''
# export GITHUB_RUN_ID=''
# export GITHUB_SERVER_URL=''

pushd "$DIR/../.qualops"

trap "popd" EXIT

# node /Users/dave/dev/github.com/eggai-tech/qualops/dist/github/run-integration.js
