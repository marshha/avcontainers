# docker-alpine-clamav
A docker container based on alpine:latest which compiles clamav from source.

## Build the container
Run the following commands

    cd docker
    sudo docker build -t alpine-clamav:$(date +%Y%m%d) .
    
