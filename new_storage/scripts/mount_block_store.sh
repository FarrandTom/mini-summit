#!/bin/bash -e
BASEDIR="$(dirname "$0")"
# shellcheck disable=SC1090
source ${BASEDIR}/env.sh

ROOT_DIR=/home
RUN_DIR=$ROOT_DIR/volume

# Using parted to partition the disc, and then formatting.
parted -s -a optimal /dev/vdd mklabel gpt -- mkpart logical ext3 2048s -2048s
mkfs -t ext3 /dev/vdd1

echo "Mounting block storage (/dev/vdd1) to volume dir (/home/volume)"
mkdir -p ${RUN_DIR}
mount /dev/vdd1 ${RUN_DIR}