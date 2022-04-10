#!/bin/bash

for device in $(/usr/bin/ls /run/synostorage/disks); do
	PREFIX=/run/synostorage/disks/${device}

	touch $PREFIX/compatibility.lock

	echo 'support' > $PREFIX/compatibility
	echo 'support' > $PREFIX/force_compatibility
  
  # sourced from /var/lib/disk-compatibility/host_rule.db
	echo '{"discard_from_web":false,"notification":false,"selectable":true,"alert":false,"ui_compatibility":"support"}' > $PREFIX/compatibility_action
done

/usr/syno/bin/syno_disk_db_update

exit 0
