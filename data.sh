#!/bin/bash
set -e

# Update packages
apt update -y
apt install -y nginx git

# Enable & start nginx
systemctl enable nginx
systemctl start nginx

# Clone your GitHub repo
git clone https://github.com/aniket-jagadale/static-web-page-deployement-using-jenkins-cicd.git /var/www/html

# Set permissions
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# Restart nginx
systemctl restart nginx
