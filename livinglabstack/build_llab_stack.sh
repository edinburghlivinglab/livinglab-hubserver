#!/usr/bin/env bash

curl https://raw.githubusercontent.com/edinburghlivinglab/dds-notebooks/master/requirements.txt > requirements.txt

# have to remove certain packages
cp requirements.txt requirements.txt.backup
cat requirements.txt.backup | grep -v igraph > requirements.txt
cat requirements.txt | grep -v jupyterhub > requirements.txt.2
cp requirements.txt requirements.txt.3

for PYTHONVER in 2 3 ; do
  PIP="pip$PYTHONVER"
  REQ="requirements.txt.$PYTHONVER"
  $PIP install --upgrade pip
  # Installing living lab requirements
  $PIP install -r $REQ
done

# Reduce the image size
apt-get autoremove -y
apt-get clean -y
