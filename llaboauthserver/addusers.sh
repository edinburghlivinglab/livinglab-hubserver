#!/bin/sh

IFS="
"
for line in `cat userlist`; do
  test -z "$line" && continue
  user=`echo $line | cut -f 1 -d' '`
  echo "adding user $user"
  useradd -m -g users -s /bin/bash $user
  git clone https://github.com/edinburghlivinglab/dds-notebooks.git /home/$user/dds-notebooks
  curl https://raw.githubusercontent.com/edinburghlivinglab/livinglab-hubserver/master/Extra%20Resources.ipynb > Extra-Resources.ipynb
  chown -R $user:users /home/$user
  chmod -R 700 /home/$user
  cd /home/$user/dds-notebooks
  git config user.email $USER@$HOSTNAME
  git config user.name $USER
done
