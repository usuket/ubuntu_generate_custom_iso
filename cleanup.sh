#!/bin/bash
set -eu
source _variable.sh

# create mount point and tmp
mkdir -p $MOUNT_DIR


if grep -qs $MOUNT_DIR /proc/mounts; then
  echo "$MOUNT_DIR is mounted. unmount before mount."
  sudo umount $MOUNT_DIR
  echo "unmount $MOUNT_DIR finished."
fi

sudo rm -rf work
echo "clean up finished"
