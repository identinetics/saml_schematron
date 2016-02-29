#!/usr/bin/env bash

# get config
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPTDIR/conf.sh

# first start: create user/group/host directories
if ! id -u $CONTAINERUSER &>/dev/null; then
    groupadd -g $CONTAINERUID $CONTAINERUSER
    adduser -M -g $CONTAINERUID -u $CONTAINERUID $CONTAINERUSER
fi
if [ -d $HOSTVOLROOT/var/log/$CONTAINERNAME ]; then
    mkdir -p $HOSTVOLROOT/var/log
    chown $CONTAINERUSER:$CONTAINERUSER $HOSTVOLROOT/var/log
fi

# default is to start in background; override with -i
runopt='-d --restart=unless-stopped'
while getopts ":i" opt; do
  case $opt in
    i)
      echo "starting docker container in interactive mode"
      runopt='-it --rm'
      docker rm $CONTAINERNAME 2>/dev/null
      ;;
  esac
done
shift $((OPTIND-1))

docker run $runopt --hostname=$CONTAINERNAME \
    --name=$CONTAINERNAME \
    --net=$INTERCONTAINER_NETWORK \
    -e "WEBAPPURL=$WEBAPPURL" \
    -v "$HOSTVOLROOT/var/log:/var/log:Z" \
    $IMAGENAME $@