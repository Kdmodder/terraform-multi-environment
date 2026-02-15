#!/bin/bash

sudo apt update
sudo apt install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx

echo "<h1>Nginx has been installed and started successfully.</h1>" | sudo tee /var/www/html/index.html