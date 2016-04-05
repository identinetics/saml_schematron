#!/usr/bin/env bash

export IMGID='4'  # range from 2 .. 99; must be unique
export IMAGENAME="r2h2/samlschtron${IMGID}"
export IMGID='4'  # range from 1 .. 99; must be unique
export CONTAINERNAME="${IMGID}mdvalTestPvAt"
export CONTAINERUID="800${IMGID}"   # gid and uid for CONTAINERUSER
export CONTAINERUSER="samlschtron${IMGID}"   # group and user to run container
export ENVSETTING=""
export NETWORKSETTINGS="
    --net http_proxy
    --ip 10.1.1.${IMGID}
"
export STARTCMD='/start.sh'
export VOLROOT="/docker_volumes/$CONTAINERNAME"  # container volumes on docker host
export VOLMAPPING="-v $VOLROOT/var/log:/var/log:Z"

# first start: create user/group/host directories
if ! id -u $CONTAINERUSER &>/dev/null; then
    groupadd -g $CONTAINERUID $CONTAINERUSER
    adduser -M -g $CONTAINERUID -u $CONTAINERUID $CONTAINERUSER
fi

# create dir with given user if not existing, relative to $HOSTVOLROOT
function chkdir {
    dir=$1
    user=$2
    mkdir -p "$VOLROOT/$dir"
    chown -R $user:$user "$VOLROOT/$dir"
}
chkdir var/log $CONTAINERUSER
