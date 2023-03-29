#!/bin/bash
sudo yum update -y
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<html>Hi cydar medical, I am a Rohith Vurukonda</html>"  > /usr/share/nginx/html/index.html
