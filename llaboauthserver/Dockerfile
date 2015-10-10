# Designed to be run as 
# 
# docker run -it -p 8000:8000 jupyter/oauthenticator

FROM gngdb/llabjupyterhub

MAINTAINER Gavin Gray <g.d.b.gray@sms.ed.ac.uk>

RUN apt-get update

# Install oauthenticator from github
RUN pip install git+git://github.com/jupyter/oauthenticator.git
# Create oauthenticator directory and put necessary files in it
RUN mkdir /srv/oauthenticator
WORKDIR /srv/oauthenticator
ENV OAUTHENTICATOR_DIR /srv/oauthenticator
ADD addusers.sh /srv/oauthenticator/addusers.sh
ADD userlist /srv/oauthenticator/userlist
ADD ssl /srv/oauthenticator/ssl
RUN chmod 700 /srv/oauthenticator

# Add the script to auto-update notebooks, and load the crontab to run it
ADD update_dds_notebooks.sh /srv/oauthenticator/update_dds_notebooks.sh
ADD root-crontab /srv/oauthenticator/root-crontab
RUN crontab /srv/oauthenticator/root-crontab

RUN ["bash", "+x", "/srv/oauthenticator/addusers.sh"]
