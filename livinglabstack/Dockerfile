FROM ipython/scipystack

MAINTAINER Gavin Gray <gavingray1729@gmail.com>

USER root

# install requirements for many python packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential python-dev libgeos-c1 libxml2-dev libxslt-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/
ADD build_llab_stack.sh /tmp/build_llab_stack.sh
RUN sh -e /tmp/build_llab_stack.sh

# Clean up from build
RUN rm -f /tmp/build_llab_stack.sh requirements*
