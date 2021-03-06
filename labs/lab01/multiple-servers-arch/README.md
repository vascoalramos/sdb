# Deployment Guide

## Simple instalation
**Note:** The configuration files consider that the VM where you have:
- the master server with NGINX (master) has ip address `10.0.0.101`
- the web server 1 (node1) has the ip address `10.0.0.102`
- the web server 2 (nod2) has the ip address `10.0.0.103`
- the web server 3 (node3) has the ip address `10.0.0.104`
- the database (bds) has the ip address `10.0.0.105`

Run: `vagrant up`

### BDs
From your machine, copy the files to a folder on the VM: `scp -r databases/* vagrant@10.0.0.105:config`

#### Install MySQL
1. `sudo apt update && sudo apt install -y mysql-server`
2. `sudo mysql -p`
3. 
    ```mysql
    CREATE DATABASE swap;
    CREATE USER 'user'@'%' IDENTIFIED BY 'password';
    GRANT ALL PRIVILEGES ON swap.* TO 'user'@'%' WITH GRANT OPTION;
    ```
4. Use custom configuration: `sudo mv config/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf`
5. Restart MySQL service: `sudo systemctl restart mysql`

#### Install Redis
1. `sudo apt update && sudo apt install -y redis-server`
4. Use custom configuration: `sudo mv config/redis.conf /etc/redis/redis.conf`
5. Restart MySQL service: `sudo systemctl restart redis`

### Nodes 1, 2 and 3
1. From your machine, copy the files to a folder on the VM: `scp -r app-server vagrant@10.0.0.10x:`
2. From your VM1, run the script to install packages:  `sudo bash app-server/install.sh`
3. From your VM1, run the script to install dependencies and run the webapp:  `bash app-server/run.sh`

### Master
1. Copy nginx config to VM: `scp -r nginx/* <user>@10.0.0.101:config`
2. Use custom configuration: `sudo bash config/setup.sh`