#!/bin/bash

docker build . -t mima84/freepbx-de 
docker stop freepbx2
docker rm freepbx2
docker run --net=host --name freepbx2  -d -t mima84/freepbx-de
docker exec -it freepbx2 bash


