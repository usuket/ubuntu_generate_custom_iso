#!/bin/bash
set -eu
source _variable.sh

# create mount point and tmp
mkdir -p $MOUNT_DIR

# create temp dir and download base iso file.
mkdir -p work

if [ ! -d "config" ]; then
  # Control will enter here if $DIRECTORY NOT exists.
  echo "error. config directory does not exists."
  exit -1
fi

if [ ! -e $TMP_IMAGE_FILE_PATH ]; then
  echo "File does not exist. download first."
  wget -O $TMP_IMAGE_FILE_PATH $ISO_DOWNLOAD_URL
fi
echo "use $TMP_IMAGE_FILE_PATH"

if grep -qs $MOUNT_DIR /proc/mounts; then
  echo "$MOUNT_DIR is mounted. unmount before mount."
  sudo umount $MOUNT_DIR
  echo "unmount $MOUNT_DIR finished."
else
  echo "$MOUNT_DIR It's not mounted.";
fi

echo "mount $MOUNT_DIR"
sudo mount -t iso9660 -o loop,ro $TMP_IMAGE_FILE_PATH $MOUNT_DIR
echo "$MOUNT_DIR is ready"


# Clean up dir
echo "Remove all file under $WORKING_DIR"
sudo rm -rf $WORKING_DIR
mkdir -p $WORKING_DIR

# Set variable to back this working directory.  
CURRENT_WORKING_DIR=`pwd`

ABS_EXPORT_PATH="`pwd`/$WORKING_DIR"
echo "Copy files from $MOUNT_DIR to $ABS_EXPORT_PATH"

# Move workind directry, If not cpio create wrong directorie structure.
# Find and copy files except symbolic link.
cd $MOUNT_DIR 
sudo find . ! -type l | cpio -pdum "$ABS_EXPORT_PATH"
cd $CURRENT_WORKING_DIR

echo "Rewrite configuration files"
sudo cp -v config/isolinux.cfg "$WORKING_DIR/isolinux/isolinux.cfg"
sudo cp -v config/preseed.cfg "$WORKING_DIR/preseed/preseed.cfg"

echo "Generate custom ISO image"
rm -vf $OUTPUT_IMAGE_PATH
sudo genisoimage -quiet -N -J -R -D -V "PRESEED" -o $OUTPUT_IMAGE_PATH -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table $WORKING_DIR
sudo chmod 644 $OUTPUT_IMAGE_PATH

echo "ISO file created"
ls -la $OUTPUT_IMAGE_PATH
sudo umount $MOUNT_DIR
echo "clean up finished"
