# Living lab JupyterHub image, based on the jupyter/jupyterhub Dockerfile
FROM gngdb/llabstack

MAINTAINER Gavin Gray <gavingray1729@gmail.com>

# Pre-setup from jupyter/notebook
ENV DEBIAN_FRONTEND noninteractive

# Not essential, but wise to set the lang
# Note: Users with other languages should set this in their derivative image
RUN apt-get update && apt-get install -y language-pack-en
ENV LANGUAGE en_GB.UTF-8
ENV LANG en_GB.UTF-8
ENV LC_ALL en_GB.UTF-8

RUN locale-gen en_GB.UTF-8
RUN dpkg-reconfigure locales

# Python binary dependencies, developer tools
RUN apt-get update && apt-get install -y -q \
    build-essential \
    make \
    gcc \
    zlib1g-dev \
    git \
    python \
    python-dev \
    python-pip \
    python3-dev \
    python3-pip \
    python-sphinx \
    python3-sphinx \
    libzmq3-dev \
    sqlite3 \
    libsqlite3-dev \
    pandoc \
    libcurl4-openssl-dev \
    nodejs \
    nodejs-legacy \
    npm

# install js dependencies
RUN npm install -g configurable-http-proxy

RUN mkdir -p /srv/

# install jupyterhub
ADD requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

WORKDIR /srv/
RUN git clone https://github.com/edinburghlivinglab/jupyterhub.git
WORKDIR /srv/jupyterhub/

RUN pip3 install .

WORKDIR /srv/jupyterhub/

# Derivative containers should add jupyterhub config,
# which will be used when starting the application.
EXPOSE 8000

ONBUILD ADD jupyterhub_config.py /srv/jupyterhub/jupyterhub_config.py
CMD ["jupyterhub", "-f", "/srv/jupyterhub/jupyterhub_config.py"]
