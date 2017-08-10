#!/bin/bash
##run this command in pcfdev vm. (cf dev ssh)
sudo su -
cd /
swapoff -a
dd if=/dev/zero of=/swapfile bs=1M count=16384
mkswap /swapfile
swapon /swapfile
sed -i -e 's/memory_mb":"auto"/memory_mb":"65536"/' -e 's/disk_mb":"auto"/disk_mb":"65536"/' /var/vcap/jobs/rep/config/rep.json
/var/vcap/bosh/bin/monit restart rep
