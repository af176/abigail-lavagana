#!/bin/bash
scp -i /home/abigail/lavagna.pem lavagna-startup-package_$1.tar.gz ec2-user@18.191.119.55:~/
ssh -i /home/abigail/lavagna.pem ec2-user@18.191.119.55 "tar -xf lavagna-startup-package_$1.tar.gz && cd project && docker-compose up --build" 