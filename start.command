#!/bin/bash

del_stopped firefox-alpine

docker run -d \
        --device /dev/snd \
        --device /dev/dri \
	--device /dev/video0 \
	--device /dev/bus/usb \
	--group-add audio \
	--group-add video \
	-v $HOME/Downloads:$HOME/Downloads \
	-v $HOME/Desktop:$HOME/Desktop \
	-v $HOME/.mozilla:$HOME/.mozilla \
        -v $HOME/.cache/mozilla/firefox:$HOME/.cache/mozilla/firefox \
	-e DISPLAY=unix$DISPLAY \
        -e GDK_SCALE \
        -e GDK_DPI_SCALE \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /etc/localtime:/etc/localtime:ro \
	--name firefox-alpine ehudkaldor/firefox-alpine

