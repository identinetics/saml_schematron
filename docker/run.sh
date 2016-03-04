#!/usr/bin/env bash

SCRIPTDIR=$(cd $(dirname $BASH_SOURCE[0]) && pwd)
source $SCRIPTDIR/conf.sh

useropt="-u $CONTAINERUSER"
runopt='-d --restart=unless-stopped'
while getopts ":hipr" opt; do
  case $opt in
    i)
      echo "starting docker container in interactive mode"
      runopt='-it --rm'
      docker rm $CONTAINERNAME 2>/dev/null
      ;;
    p)
      print="True"
      ;;
    r)
      echo "container user is root"
      useropt='-u 0'
      ;;
    *)
      echo "usage: $0 [-h] [-i] [-p] [-r] [cmd]
   -h  print this help text
   -i  start in interactive mode and remove container afterward
   -p  print docker run command on stdout
   -r  start command as root user (default is $CONTAINERUSER)
   cmd shell command to be executed (default is $STARTCMD)"
      exit 0
      ;;
  esac
done

shift $((OPTIND-1))

if [ -z "$1" ]; then
    cmd=$STARTCMD
else
    cmd=$@
fi

docker_run="docker run $runopt $useropt --hostname=$CONTAINERNAME --name=$CONTAINERNAME
    $ENVSETTINGS $NETWORKSETTINGS $VOLMAPPING $IMAGENAME $cmd"

if [ $(id -u) -ne 0 ]; then
    sudo="sudo"
fi
${sudo} docker rm -f $CONTAINERNAME 2>/dev/null || true
if [ "$print" = "True" ]; then
    echo $docker_run
fi
${sudo} $docker_run
