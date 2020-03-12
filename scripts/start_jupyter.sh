#!/bin/bash -e

RUN_DIR=/home/volume

source /home/volume/anaconda3/etc/profile.d/conda.sh
conda activate wmlce_env

## Start Jupyter Lab
echo "Starting Jupyter Lab..."
cd ${RUN_DIR}
nohup jupyter lab --ip=0.0.0.0 --allow-root --port 443 --no-browser --NotebookApp.token="$1" > error.log &
echo "Jupyter lab up and running!"
