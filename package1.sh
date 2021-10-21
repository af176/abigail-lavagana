#!/bin/bash
cd project || exit
docker build -t lavagna:$1 .
docker tag lavagna:$1 651733321730.dkr.ecr.us-east-1.amazonaws.com/abigail:lavagna-$1
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 651733321730.dkr.ecr.us-east-1.amazonaws.com
docker push 651733321730.dkr.ecr.us-east-1.amazonaws.com/abigail:lavagna-$1
cd ..
tar -cv -f lavagna-startup-package_$1.tar.gz ./project/docker-compose.yml ./project/src/main/webapp ./project/nginx.conf ./init.sh