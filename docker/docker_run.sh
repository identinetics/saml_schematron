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
while getopts ":ir" opt; do
  case $opt in
    i)
      echo "starting docker container in interactive mode"
      runopt='-it --rm'
      docker rm $CONTAINERNAME 2>/dev/null
      ;;
    r)
      echo "container user is root"
      useropt='-u 0'
      ;;
  esac
done
shift $((OPTIND-1))

if [ $(id -u) -ne 0 ]; then
    sudo="sudo"
fi
${sudo} docker run $runopt $useropt --hostname=$CONTAINERNAME \
    --name=$CONTAINERNAME \
    --net=$INTERCONTAINER_NETWORK \
    -e "WEBAPPURL=$WEBAPPURL" \
    -v "$HOSTVOLROOT/var/log:/var/log:Z" \
    $IMAGENAME $@