#!/bin/bash

#docker build -t cqube-minio-image ./shell_scripts/minio
#docker run -p 9000:9000 --name cqube_minio -d cqube-minio-image:latest

docker pull minio/minio
docker run -p 9000:9000 -p 9001:9001 --name cqube_minio -d minio/minio:latest server /data --console-address ":9001"