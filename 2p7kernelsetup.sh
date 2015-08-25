#!/bin/bash
# Script to add required packages to Python 2.7 kernel
wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O miniconda.sh
bash miniconda.sh -b -p /opt/miniconda
rm miniconda.sh
export PATH=/opt/miniconda/bin:$PATH
conda update --quiet --yes conda
conda install --quiet --yes --file conda-requirements.txt
pip install -r requirements.txt
pip install file:///srv/jupyterhub
python2.7 -m IPython kernelspec install-self
# clean up
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
conda clean -y -t
