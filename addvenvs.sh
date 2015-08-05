#!/bin/bash
# Script to remove default kernels and add in kernels set up in virtualenvs 
# containing all of the required dependencies.
export PATH=/root/miniconda3/bin:$PATH
conda update --yes conda
# creating two venvs with different requirements, and installing them
conda create --yes -q -n llabvenv python=3.4 --file conda-requirements.txt
conda create --yes -q -n ppbmfhvenv python=3.4 --file conda-requirements.txt
# enter first for pip install
source activate llabvenv
pip install -r requirements.txt
source deactivate
# enter second for pip install
source activate ppbmfhvenv
pip install -r ppbmfh_requirements.txt
source deactivate
