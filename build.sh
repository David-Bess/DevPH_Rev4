#!/bin/bash

. /root/dockerfiles/start_scripts/build.sh $@ # && (echo "Parent build.sh failed"; exit 1)

#Build hdp_hive_node
echo -e "\n*** Building hwux/hdp_hive_node ***\n"
cd /root/dockerfiles/hdp_hive_node
docker build -t hwxu/hdp_hive_node .
echo -e "\n*** Build of hwxu/hdp_hive_node complete! ***\n"

#Add custom tasks for Pig/Hive course here...
apt-get -y install python-setuptools
easy_install avro

apt-get update
apt-get -y install mysql-client
echo "alias mysql='mysql -h hiveserver'" >> /etc/profile

echo -e "\n*** The lab environment has successfully been built for this classroom VM ***\n"
