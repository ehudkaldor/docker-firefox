#!/bin/bash

docker run -d \
  --rm \
  --device /dev/snd \
  --device /dev/dri \
	--device /dev/video0 \
	--device /dev/bus/usb \
	--group-add audio \
	--group-add video \
	-e DISPLAY=unix$DISPLAY \
        -e GDK_SCALE \
        -e GDK_DPI_SCALE \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /etc/localtime:/etc/localtime:ro \
	--name firefox-alpine ehudkaldor/firefox
