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

#Fix bug in /etc/hosts (JIRA TRNG-715)
echo "127.0.0.1       localhost     ubuntu" >> /etc/hosts

#Containers start at bootup (JIRA TRNG-703)
echo 'DOCKER_OPTS=" -r=true"' >> /etc/default/docker

echo "Copying Tez config files..."
cp /root/$COURSE_DIR/conf/* /etc/tez/conf/

echo -e "\n*** The lab environment has successfully been built for this classroom VM ***\n"
