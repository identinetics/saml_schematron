#!/usr/bin/env bash


if [ ! -d 'opt/PVZDpolman' ]; then
    cd opt && git clone https://github.com/rhoerbe/PVZDpolman
    cd PVZDpolman/dependent_pkg
    mkdir YAmikep && cd YAmikep && git clone https://github.com/YAmikep/json2html.git && cd ..
    ln -s YAmikep/json2html json2html
    mkdir benson-basis && cd benson-basis && git clone https://github.com/benson-basis/pyjnius.git && cd ..
    ln -s benson-basis/pyjnius pyjnius
    curl -O https://pypi.python.org/packages/source/o/ordereddict/ordereddict-1.1.tar.gz
    tar -xzf ordereddict-*.tar.gz
    cd ../../..
fi

docker build -t=pvzdbe .