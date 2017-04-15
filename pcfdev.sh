#!/bin/bash
##run this command in pcfdev vm. (cf dev ssh)
sudo su -
cd /
swapoff -a
dd if=/dev/zero of=/swapfile bs=1M count=16384
mkswap /swapfile
swapon /swapfile
sed -i -e "s/memoryMB=[0-9]*/memoryMB=65536/" -e "s/diskMB=[0-9]*/diskMB=65536/" /var/vcap/jobs/rep/bin/rep_as_vcap
/var/vcap/bosh/bin/monit restart rep
