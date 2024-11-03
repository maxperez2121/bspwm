#!/bin/bash
pid=$(pgrep -x picom)

if [ $pid ]; then
    kill -9 $pid
    picom -f
else
    picom -f
if
