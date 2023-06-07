#!/bin/bash


if ! [ $( docker ps -a | grep cqube_minio | wc -l ) -gt 0 ]; then
   # minio setup as a contaioner
   docker pull minio/minio
   docker network create cqube_net
   docker run -p 9000:9000 -p 9001:9001 --name cqube_minio --restart=always --network cqube_net -d minio/minio:latest server /data --console-address ":9001"

   # Minio user creation
   # Download the mc binary
   wget https://dl.min.io/client/mc/release/linux-amd64/mc

   # Make the mc binary executable
   chmod +x mc

   # Move the mc binary to /usr/local/bin
   mv mc /usr/local/bin
   docker_host=localhost

   mc alias set myminio http://$docker_host:9000 minioadmin minioadmin
   mc mb myminio/cqube-minio-bucket
fi
