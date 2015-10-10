#!/bin/sh
#
# Script to update all users dds_notebooks repo,
# stashing any changes they have made.
IFS="
"
for line in `cat userlist`; do
  test -z "$line" && continue
  user=`echo $line | cut -f 1 -d' '`
  sudo -u $user -H sh -c "cd /home/$user/dds-notebooks && python auto-update.py"
done
