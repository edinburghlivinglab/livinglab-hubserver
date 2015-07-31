# Designed to be run as 
# 
# docker run -it -p 8000:8000 jupyter/oauthenticator

FROM jupyter/jupyterhub

MAINTAINER Project Jupyter <ipython-dev@scipy.org>

# Install oauthenticator from git
RUN pip3 install git+git://github.com/jupyter/oauthenticator.git

# Preinstall large packages with conda
#   start by installing conda and updating
RUN apt-get install wget
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
RUN chmod +x miniconda.sh
RUN ./miniconda.sh -b
RUN export PATH=/root/miniconda/bin:$PATH
RUN conda update --yes conda
#   then create a venv and add requirements
ADD conda-requirements.txt
RUN conda create --yes -q -n pyenv python=3.4 --file conda-requirements.txt
#   and activate the venv
RUN source activate pyenv

# Install remaining requirements with pip
ADD requirements.txt
RUN pip3 install -r requirements.txt

# Create oauthenticator directory and put necessary files in it
RUN mkdir /srv/oauthenticator
WORKDIR /srv/oauthenticator
ENV OAUTHENTICATOR_DIR /srv/oauthenticator
ADD addusers.sh /srv/oauthenticator/addusers.sh
ADD userlist /srv/oauthenticator/userlist
ADD ssl /srv/oauthenticator/ssl
RUN chmod 700 /srv/oauthenticator

RUN ["sh", "/srv/oauthenticator/addusers.sh"]
