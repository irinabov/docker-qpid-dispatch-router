#!/bin/bash -ex
#
docker build -t irinabov/docker-qpid-dispatch-router . > ../build-latest.log 2>&1
exit

