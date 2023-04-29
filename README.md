# Wordpress-LEMP

For this challenge, we have to set up a WordPress, with a DB and a backup server for the WordPress server and DB server, so I become to create 3 VM:
1. WordPress server
2. MariaDB server
3. Backup server

First of all, I start the configuration of the MariaDB server, installing MariaDB on it and set up the firewall (UFW) to allow the connections (3306, 22 ports) from the others VMS, then I go for the WordPress server, installing and configuring NGINX, PHP and their dependencies, then I download and install WordPress by WP-CLI and to end, setting up the firewall (UFW) wo allow the connections (22, 80 ports). to end this challenge, I set up the last VM, making your that I can run the bash script for the backups and setting up the crontab

![image](https://user-images.githubusercontent.com/92232117/235316325-8af6ae9c-429b-4bc7-8e66-e152c1f75361.png)
