#!/bin/bash
# run as part of user authentication, assumes it is passed user name as first arg
su $1
cd ~/
# clone notebooks and associated notebook
git clone https://github.com/edinburghlivinglab/dds-notebooks.git
curl https://raw.githubusercontent.com/edinburghlivinglab/livinglab-hubserver/master/Extra%20Resources.ipynb > Extra-Resources.ipynb
git config user.email '$1@$HOSTNAME' && git config user.name '$1'
