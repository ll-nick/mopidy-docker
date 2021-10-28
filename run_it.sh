#!/bin/bash

docker run \
 --rm \
 --name mopidy \
 --volume /home/pi/jukebox/mopidy-docker/mopidy.conf:/root/.config/mopidy/mopidy.conf \
 --volume /tmp/audio-output:/tmp \
 -p 6680:6680 \
 -it \
 nickll/mopidy:raspbian
