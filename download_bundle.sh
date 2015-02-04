#!/bin/bash
# https://github.com/JonathonReinhart/git-download-bundle
#
# References:
# http://stackoverflow.com/questions/1251713
# http://stackoverflow.com/questions/965053
set -e

if [ $# -lt 1 ]; then
    echo "Usage: $(basename $0) git-repo"
    exit 1
fi

url=$1                          # e.g. "git@github.com:person/project.git"
gitdir=$(basename $url)         # e.g. "project.git"
bundle="${gitdir%.*}.bundle"    # e.g. "project.bundle" 

git clone --mirror $url

git --git-dir $gitdir bundle create $bundle --all

rm -rf $gitdir
