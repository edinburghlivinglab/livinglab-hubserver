#!/bin/sh

IFS="
"
for line in `cat userlist`; do
  test -z "$line" && continue
  user=`echo $line | cut -f 1 -d' '`
  echo "adding user $user"
  useradd -m -s /bin/bash $user
  git clone https://github.com/edinburghlivinglab/dds-notebooks.git /home/$user/examples
  chown -R $user /home/$user/examples
done
