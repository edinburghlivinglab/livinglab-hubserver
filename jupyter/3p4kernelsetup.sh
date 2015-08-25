#!/bin/bash
# Script to add required packages to Python 3.4 kernel
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash miniconda.sh -b -p /opt/miniconda3
rm miniconda.sh
export PATH=/opt/miniconda3/bin:$PATH
conda update --quiet --yes conda
conda install --quiet --yes --file conda-requirements.txt
pip install -r requirements.txt
python3.4 -m IPython kernelspec install-self
# clean up
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
conda clean -y -t
