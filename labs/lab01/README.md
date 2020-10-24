# Deployment Guide

## Simple instalation
**Note:** The configuration files consider that the VM where you have:
- the web server (VM1) has the ip address `10.0.0.101`
- the database (VM2) has the ip address `10.0.0.102`


### VM2
From your machine, copy the files to a folder on the VM: `scp -r databases <user>@10.0.0.102:<path-to-folder>`

#### Install MySQL
1. `sudo apt update && sudo apt install -y mysql-server`
2. `sudo mysql -p`
3. 
    ```mysql
    CREATE DATABASE swap;
    CREATE USER 'user'@'10.0.0.101' IDENTIFIED BY 'password';
    GRANT ALL PRIVILEGES ON swap.* TO 'user'@'10.0.0.101' WITH GRANT OPTION;
    ```
4. Use custom configuration: `sudo mv databases/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf`
5. Restart MySQL service: `sudo systemctl restart mysql`

#### Install Redis
1. `sudo apt update && sudo apt install -y redis-server`
4. Use custom configuration: `sudo mv databases/redis.conf /etc/redis/redis.conf`
5. Restart MySQL service: `sudo systemctl restart redis`

### VM1
1. From your machine, copy the files to a folder on the VM: `scp -r app-server <user>@10.0.0.101:<path-to-folder>`
2. From your VM1, run the script to install packages:  `sudo bash install.sh`
3. From your VM1, run the script to install dependencies and run the webapp:  `bash <path-to-folder>/run.sh`