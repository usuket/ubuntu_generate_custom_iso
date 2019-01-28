#!/bin/bash

set -eu

# Set iso image url
ISO_DOWNLOAD_URL="http://cdimage.ubuntu.com/releases/18.04.1/release/ubuntu-18.04.1-server-amd64.iso"

# REQUIRED
MOUNT_DIR="work/ubuntu_mount"
WORKING_DIR="work/ubuntu_mount_r"
TMP_IMAGE_FILE_PATH="tmp/ubuntu_image.iso"
OUTPUT_IMAGE_PATH="out/customized_ubuntu.iso"
