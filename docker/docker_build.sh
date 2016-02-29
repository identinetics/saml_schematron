#!/usr/bin/env bash

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPTDIR/conf.sh

docker build --build-arg ["USERNAME=$CONTAINERUSER", "UID=$CONTAINERUID"] -t=$IMAGENAME .
