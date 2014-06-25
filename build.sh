#!/bin/bash

. /root/dockerfiles/start_scripts/build.sh $@ # && (echo "Parent build.sh failed"; exit 1)

#Add custom tasks for Pig/Hive course here...
apt-get -y install python-setuptools
easy_install avro

echo -e "\n*** The lab environment has successfully been built for this classroom VM ***\n"
