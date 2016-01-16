#!/bin/sh
for I in $(ls /onStart.d)
do
    . /onStart.d/$I
done

# Run the command
sh -c "$*"

for I in $(ls /onQuit.d)
do
    . /onQuit.d/$I
done
