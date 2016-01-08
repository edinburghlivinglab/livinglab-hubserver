#!/bin/bash
# run as part of user authentication, assumes it is passed user name as first arg
sudo -u $1 -H sh -c -x "cd /home/$1 && git config user.email '$1@$HOSTNAME' && git config user.name '$1' && git clone https://github.com/edinburghlivinglab/dds-notebooks.git && curl https://raw.githubusercontent.com/edinburghlivinglab/livinglab-hubserver/master/Extra%20Resources.ipynb > Extra-Resources.ipynb"
