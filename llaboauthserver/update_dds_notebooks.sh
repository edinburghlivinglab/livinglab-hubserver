#!/bin/sh
#
# Script to update all users dds_notebooks repo,
# stashing any changes they have made.

for line in `cat userlist`; do
  test -z "$line" && continue
  user=`echo $line | cut -f 1 -d' '`
  sudo -u $user -H sh -c "cd /home/$user/dds-notebooks;\
                          git stash;\
                          git pull origin master"
done
