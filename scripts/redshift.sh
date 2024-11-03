#!/usr/bash

pid=$(pgrep -x redshift)

if [ $pid ]; then
    kill -9 $pid

    redshift -x

    redshift -l 55.7:12.6 -t 5700:3600 -g 0.9 -m randr -v &
else
    redshift -l 55.7:12.6 -t 5700:3600 -g 0.9 -m randr -v &
fi
