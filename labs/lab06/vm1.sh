#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install -y default-jre default-jdk

# install elasticsearch
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt update
sudo apt install -y elasticsearch

# configure elasticsearch
# -> network.host: 0.0.0.0
# -> discovery.seed hosts: []
# -> cluster.initial master nodes: ["<VM1 ip>"]
sudo vim /etc/elasticsearch/elasticsearch.yml

# start elasticsearch
sudo systemctl start elasticsearch
sudo systemctl enable elasticsearch

# increase VM map count if required
sudo sysctl -w vm.max_map_count=262144

# install kibana
sudo apt install -y kibana

# configure kibana
# -> server.host: 0.0.0.0
sudo vim /etc/kibana/kibana.yml

# start elasticsearch
sudo systemctl enable kibana
sudo systemctl start kibana
