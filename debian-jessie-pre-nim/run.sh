#!/bin/sh
for I in $(ls /onStart.d)
do
    . /onStart.d/$I
done

# Run the command
sh -c "$*"
EXIT_CODE=$?

for I in $(ls /onQuit.d)
do
    . /onQuit.d/$I
done

exit $EXIT_CODE
