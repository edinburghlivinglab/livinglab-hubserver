# Designed to be run as 
# 
# docker run -it -p 8000:8000 jupyter/oauthenticator

FROM gngdb/llabjupyterhub

MAINTAINER Gavin Gray <g.d.b.gray@sms.ed.ac.uk>

RUN apt-get update

# Install Magnus Hagdorn's remote user plugin
RUN cd /srv/ && git clone https://github.com/edina/jhub_remote_user_authenticator.git && \
    cd jhub_remote_user_authenticator && python3 setup.py install
# Update config with two extra lines
ADD jupyterhub_config.py /srv/jupyterhub/jupyterhub_config.py

# Add the script to auto-update notebooks, and load the crontab to run it
ADD update_dds_notebooks.sh /srv/update_dds_notebooks.sh
ADD root-crontab /srv/root-crontab
RUN crontab /srv/root-crontab

# Add the script to initialise new users
ADD user_init.sh user_init.sh 
