#!/usr/bin/env bash
set -e

# have to remove certain packages
cat requirements.txt | grep -v jupyterhub > requirements.txt.2
cp requirements.txt requirements.txt.3
cat ppbmh_requirements.txt | grep -v pymc | grep -v wsgiref > ppbmh_requirements.nopymc.txt

# clone in dds lab
git clone https://github.com/edinburghlivinglab/dds-notebooks.git

# install for Python 3
conda install shapely
pip install -r requirements.txt.3
conda install pymc
pip install -r ppbmh_requirements.nopymc.txt
cd dds-notebooks
pip install --no-deps -e .
cd ..

# install for Python 2
source activate python2
conda install shapely
pip install -r requirements.txt.2
conda install pymc
pip install -r ppbmh_requirements.nopymc.txt
cd dds-notebooks
pip install --no-deps -e .
cd ..
