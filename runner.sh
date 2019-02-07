#!/bin/bash

# generate_iso
rm -rf additional/ && rm -rf config/
cp -rf config_template config && cp -rf additional_template additional
bash generate_iso.sh
# touch customized_ubuntu.iso
echo "generate_iso.sh finished"
# mv iso
variable=ubuntu_$(date +%y%m%d-%H-%M).iso
the_path=~/ttpub/Download/isos/$variable
mv customized_ubuntu.iso $variable
echo "rename finished"
mv $variable $the_path
echo "upload finished"
