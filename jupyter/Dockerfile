# Starts with the base jupyter notebook and adds all the required packages.
FROM jupyter/notebook

MAINTAINER Gavin Gray <gavingray1729@gmail.com>

# prerequisites
RUN apt-get install wget
ADD https://raw.githubusercontent.com/edinburghlivinglab/dds-notebooks/master/conda-requirements.txt conda-requirements.txt 
ADD https://raw.githubusercontent.com/edinburghlivinglab/dds-notebooks/master/requirements.txt requirements.txt
ADD https://raw.githubusercontent.com/CamDavidsonPilon/Probabilistic-Programming-and-Bayesian-Methods-for-Hackers/master/requirements.txt ppbmfh_requirements.txt

# remove existing kernels
RUN rm -rf /usr/local/share/jupyter/kernels/*
# install new ones
ADD 2p7kernelsetup.sh 2p7kernelsetup.sh
RUN ["bash", "2p7kernelsetup.sh"]
ADD 3p4kernelsetup.sh 3p4kernelsetup.sh
RUN ["bash", "3p4kernelsetup.sh"]

EXPOSE 8888
