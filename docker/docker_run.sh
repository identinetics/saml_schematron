#!/usr/bin/env bash

# there are 2 considerations for the use of the image
# 1. To access the USB device the /dev/bus/usb is mapped to the host (you may want to map a single device)
# 2. The container needs to be privileged to access the host devices
# 3. To use the SafeNet Authentication Client X11 is required. Running X11 apps
#    in the container is achieved by mapping the X11 socket to the container and
#    setting $DISPLAY to the value of the host


if [[ ! "$FRONTENDHOST" ]];  then echo "need to set FRONTENDHOST"; exit 1; fi

docker run -it --rm \
    --privileged -v /dev/bus/usb:/dev/bus/usb \
    -e FRONTENDHOST=$FRONTENDHOST \
    -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix pvzdbe