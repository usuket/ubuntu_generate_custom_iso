# ubuntu_installer_script

## Note
This script optimized for running on Ubuntu desktop and Ubuntu server.
Use Ubuntu ISO and Emulator such as Vmware, VirtualBox.
```
https://www.ubuntu.com/download/desktop/thank-you?country=JP&version=18.04.1
```

## Docs
https://www.debian.org/releases/stable/amd64/apbs02.html

## How to run this script
```
git clone https://github.com/usuket/ubuntu_generate_custom_iso.git
cd ubuntu_generate_custom_iso
cp -r config_template config
cp -r additional_template additional
# Please change preseed.cfg to change the setting.
# Commit is not recommended as it also includes users and initial passwords.
bash generate_iso.sh
ls -la customized_ubuntu.iso
```

## How to customize the initialization process
modify listed files below. 
- config/proseed.cfg
- additional/main.sh

## How to add cached file.
The directory named "additional" can be used as an interface to add some files to customized ISO.
```bash
additonal/{FILE_NAME}
# This file will appear in customized ISO.
# So it means you can access the file by installation script or main.sh
/media/cdrom/additional/{FILE_NAME}
```  

## sample preseed.cfg
```
wget -O preseed.cfg https://www.debian.org/releases/stretch/example-preseed.txt
```
