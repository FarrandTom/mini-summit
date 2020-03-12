#!/bin/bash -e
BASEDIR="$(dirname "$0")"
# shellcheck disable=SC1090
source ${BASEDIR}/env.sh

ROOT_DIR=/home
RUN_DIR=$ROOT_DIR/volume

# As the block store already exists, and is formatted and partitioned all we need to do is mount.
echo "Mounting block storage (/dev/vdd1) to volume dir (/home/volume)"
mkdir -p ${RUN_DIR}
mount /dev/vdd1 ${RUN_DIR}