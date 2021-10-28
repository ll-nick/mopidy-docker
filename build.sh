#!/bin/bash

docker build --pull -t nickll/mopidy:raspbian --build-arg BUILD_FROM=balenalib/rpi-raspbian:latest .
