#!/usr/bin/env bash

export CONTAINERNAME='mdvalTestPvAt'
export HOSTVOLROOT="/docker_volumes/$CONTAINERNAME"  # container volumes on docker host
export IMAGENAME='saml_schematron'
export INTERCONTAINER_NETWORK='http_proxy'
export WEBAPPURL='http://mdval.test.portalverbund.at/'
export CONTAINERUSER='samlschtron'   # group and user to run container
export CONTAINERUID='8000'   # gid and uid for CONTAINERUSER
