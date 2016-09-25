#!/usr/bin/env bash

# Download required jar
PVZDJAVA_VERSION=v1.2
cd lib
curl -L -O https://github.com/rhoerbe/PVZDjava/releases/download/$PVZDJAVA_VERSION/pvzdValidateXsd.jar
