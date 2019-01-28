# ubuntu_installer_script

## Note
This script optimized for running on Ubuntu desktop and Ubuntu server.
Use Ubuntu ISO and Emulator such as Vmware, VirtualBox.
```
https://www.ubuntu.com/download/desktop/thank-you?country=JP&version=18.04.1
```

## How to run this script
```
git clone git@github.com:usuket/ubuntu_generate_custom_iso.git
cd ubuntu_generate_custom_iso
cp -r config_template config
# Please change preseed.cfg to change the setting.
# Commit is not recommended as it also includes users and initial passwords.
bash generate_iso.sh
ls -la customized_ubuntu.iso
```

## sample preseed.cfg
```
wget -O preseed.cfg https://www.debian.org/releases/stretch/example-preseed.txt
```
