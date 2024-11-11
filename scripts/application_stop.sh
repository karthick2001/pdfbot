#!/bin/bash

echo "Stopping running Docker containers..."
docker ps -q | xargs -r docker stop

echo "Removing stopped Docker containers..."
docker ps -a -q | xargs -r docker rm

echo "Removing Docker images..."
docker images -q | xargs -r docker rmi