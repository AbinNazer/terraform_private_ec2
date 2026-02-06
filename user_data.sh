#!/bin/bash
apt update -y
apt install -y docker.io
systemctl start docker
systemctl enable docker

docker run -d \
  -p 1337:1337 \
  -e HOST=0.0.0.0 \
  -e PORT=1337 \
  --name strapi \
  strapi/strapi

