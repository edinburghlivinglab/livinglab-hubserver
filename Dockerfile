# Designed to be run as 
# 
# docker run -it -p 8000:8000 jupyter/oauthenticator

FROM jupyter/jupyterhub

MAINTAINER Gavin Gray <g.d.b.gray@sms.ed.ac.uk>

# Install oauthenticator from git
RUN pip3 install git+git://github.com/jupyter/oauthenticator.git

# Install virtualenvs for custom kernels
ADD https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh miniconda.sh
RUN chmod +x miniconda.sh
RUN ./miniconda.sh -b
ADD https://raw.githubusercontent.com/edinburghlivinglab/dds-notebooks/master/conda-requirements.txt conda-requirements.txt 
ADD https://raw.githubusercontent.com/edinburghlivinglab/dds-notebooks/master/requirements.txt requirements.txt
ADD https://raw.githubusercontent.com/CamDavidsonPilon/Probabilistic-Programming-and-Bayesian-Methods-for-Hackers/master/requirements.txt ppbmfh_requirements.txt
ADD addvenvs.sh addvenvs.sh
RUN ["sh", "addvenvs.sh"]

# remove old kernels and add in new kernel jsons
RUN rm -r /usr/local/share/jupyter/kernels/*
RUN mkdir /usr/local/share/jupyter/kernels/llab
RUN mkdir /usr/local/share/jupyter/kernels/ppbmfh
ADD llab_kernel.json /usr/local/share/jupyter/kernels/llab/kernel.json
ADD ppbmfh_kernel.json /usr/local/share/jupyter/kernels/ppbmfh/kernel.json

# Create oauthenticator directory and put necessary files in it
RUN mkdir /srv/oauthenticator
WORKDIR /srv/oauthenticator
ENV OAUTHENTICATOR_DIR /srv/oauthenticator
ADD addusers.sh /srv/oauthenticator/addusers.sh
ADD userlist /srv/oauthenticator/userlist
ADD ssl /srv/oauthenticator/ssl
RUN chmod 700 /srv/oauthenticator

RUN ["sh", "/srv/oauthenticator/addusers.sh"]
