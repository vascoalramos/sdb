#!/bin/bash

sudo apt update && sudo apt upgrade -y

# add elasticsearch ppa
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt update

# install metricbeat
sudo apt install -y metricbeat

# configure metricbeat
# -> output.elasticsearch.hosts: ["<VM1 ip>"]
# -> setup.kibana.host: "<VM1 ip>:5601"
sudo vim /etc/metricbeat/metricbeat.yml

# start metricbeat
sudo systemctl start metricbeat
sudo systemctl enable metricbeat

# check available modules
sudo metricbeat modules list

# install indexes and dashboards
sudo metricbeat setup

# restart metricbeat
sudo systemctl restart metricbeat
