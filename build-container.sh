#!/bin/bash

docker build \
	--build-arg VCS_REF=$(git rev-parse --short HEAD) \
	--build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
    --build-arg user=$USER \
    --build-arg uid=$UID \
	-t youmych/docker-ivesdk:latest .
