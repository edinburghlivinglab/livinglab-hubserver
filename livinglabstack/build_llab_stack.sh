#!/usr/bin/env bash
set -e

curl https://raw.githubusercontent.com/edinburghlivinglab/dds-notebooks/master/requirements.txt > requirements.txt
curl https://raw.githubusercontent.com/CamDavidsonPilon/Probabilistic-Programming-and-Bayesian-Methods-for-Hackers/master/requirements.txt > ppbmh_requirements.txt

# have to remove certain packages
cat requirements.txt | grep -v jupyterhub > requirements.txt.2
cp requirements.txt requirements.txt.3
cat ppbmh_requirements.txt | grep -v pymc > ppbmh_requirements.nopymc.txt

# clone in dds lab
git clone https://github.com/edinburghlivinglab/dds-notebooks.git
cd dds-notebooks

# install for Python 3
conda install shapely
pip install -r requirements.txt.3
conda install pymc
pip install -r ppbmh_requirements.nopymc.txt
pip install --no-deps -e .

# install for Python 2
source activate python2
conda install shapely
pip install -r requirements.txt.2
conda install pymc
pip install -r ppbmh_requirements.nopymc.txt
pip install --no-deps -e .
