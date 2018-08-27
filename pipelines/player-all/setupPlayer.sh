#!/bin/sh

set -ex

commit_ref=${1}
build_hash=$(jq '.buildHash' ../../../metadata.json | sed 's/\"//g')
player_dir=sunbird-portal
git -C sunbird-portal pull || git clone https://github.com/project-sunbird/sunbird-portal -b ${commit_ref}
cd sunbird-portal
git checkout "$build_hash"
