#!/usr/bin/env bash

export CONTAINERNAME='mdvalTestPvAt'
export IMAGENAME='saml_schematron'
export INTERCONTAINER_NETWORK='http_proxy'
export HOSTVOLROOT="/docker_volumes/$CONTAINERNAME"
export WEBAPPURL='http://mdval.test.portalverbund.at/'

# processes in container will run with user moinmoin, equivalent to host-user docker_moinwiki:
#    groupadd docker_moinwiki
#    adduser -g docker_moinwiki docker_moinwiki
# both users need to have the same uid/gid!


runopt='-d --restart=unless-stopped'

while getopts ":i" opt; do
  case $opt in
    i)
      echo "starting docker container in interactive mode"
      runopt='-it --rm'
      docker rm httpd1 2>/dev/null
      ;;
  esac
done
shift $((OPTIND-1))

docker run $runopt --hostname=$CONTAINERNAME \
    --name=$CONTAINERNAME \
    --net=$INTERCONTAINER_NETWORK \
    -e "WEBAPPURL=$WEBAPPURL" \
    -v "$HOSTVOLROOT/var/log/$CONTAINERNAME:/var/log:Z" \
    $IMAGENAME $@