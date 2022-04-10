#!/bin/bash

# value must be a power of 2, default is 256
CACHE_SIZE=16384

for device in $(/usr/bin/ls /dev/md*); do
	SYS_FILE=/sys/block/${device//\/dev\/}/md/stripe_cache_size
	if [ -f "$SYS_FILE" ]; then
		echo $CACHE_SIZE > $SYS_FILE
	fi
done

exit 0
