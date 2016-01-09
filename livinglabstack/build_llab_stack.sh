#!/usr/bin/env bash

curl https://raw.githubusercontent.com/edinburghlivinglab/dds-notebooks/master/requirements.txt > requirements.txt
curl https://raw.githubusercontent.com/edinburghlivinglab/dds-notebooks/master/extra_requirements.txt > extra_requirements.txt
curl https://raw.githubusercontent.com/CamDavidsonPilon/Probabilistic-Programming-and-Bayesian-Methods-for-Hackers/master/requirements.txt > ppbmh_requirements.txt

# have to remove certain packages
cp requirements.txt requirements.txt.backup
cat requirements.txt.backup | grep -v igraph > requirements.txt
cat requirements.txt | grep -v jupyterhub > requirements.txt.2
cp requirements.txt requirements.txt.3

# clone in dds lab
git clone https://github.com/edinburghlivinglab/dds-notebooks.git

for PYTHONVER in 2 3 ; do
  PIP="pip$PYTHONVER"
  PYTHON="python$PYTHONVER"
  REQ="requirements.txt.$PYTHONVER"
  $PIP install --upgrade pip
  # Installing living lab requirements
  $PIP install -r $REQ
  # Install more requirements, just in case we need them later
  $PIP install -r extra_requirements.txt
  # and install extra requirements (have to do this due to wsgiref)
  cat ppbmh_requirements.txt | grep -v wsgiref | xargs $PIP install
  $PIP install scikit-learn
  $PIP install nltk
  # finally install dds_notebooks
  cd dds-notebooks
  $PIP install --no-deps -e .
  cd ..
done

# Reduce the image size
apt-get autoremove -y
apt-get clean -y
