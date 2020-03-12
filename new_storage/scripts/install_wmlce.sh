#!/bin/bash -e

RUN_DIR=/home/volume

# Install Perl - In order to use Spectrum MPI with IBM Distributed Deep Learning and SnapML, Perl must be installed on the system.
sudo apt install perl

# Download Anaconda
wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-ppc64le.sh
## Script for silent installation
bash Anaconda3-2019.10-Linux-ppc64le.sh -b -f -p /home/volume/anaconda3
## Refresh terminal
export PATH=/home/volume/anaconda3/bin:$PATH
source ~/.bashrc

## Prepend Channels
conda config --prepend channels https://public.dhe.ibm.com/ibmdl/export/pub/software/server/ibm-ai/conda/

## Create WMLCE Enviroment, can change versions of python, supported is 3.6 and 3.7
conda create --yes --quiet --name wmlce_env python=3.6
source /home/volume/anaconda3/etc/profile.d/conda.sh
conda activate wmlce_env

## Install WMLCE
export IBM_POWERAI_LICENSE_ACCEPT=yes
conda install powerai --yes --quiet
conda install jupyterlab --yes --quiet

## Start Jupyter Lab
echo "Starting Jupyter Lab..."
cd ${RUN_DIR}
nohup jupyter lab --ip=0.0.0.0 --allow-root --port 443 --no-browser --NotebookApp.token="$1" > error.log &
echo "Jupyter lab up and running!"
