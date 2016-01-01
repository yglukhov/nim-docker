#!/bin/sh
nim --version

export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/

# Start x11 server
Xvfb :1 -screen 0 1024x768x16 +extension RANDR &
export DISPLAY=:1.0

# Run the command
sh -c "$*"
