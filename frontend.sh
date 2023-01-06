#!/bin/bash
#This script is to automate frontend configuration
conf_file_location=$(pwd)  #roboconfigfile_location

yum install nginx -y

rm -rf /usr/share/nginx/html/* 

curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

#cd /usr/share/nginx/html 
unzip /tmp/frontend.zip /usr/share/nginx/html

cp '$(conf_file_location)/files/roboshop.conf' /etc/nginx/default.d/roboshop.conf

systemctl enable nginx 
systemctl start nginx
systemctl restart nginx