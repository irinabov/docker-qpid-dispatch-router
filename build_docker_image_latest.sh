#!/bin/bash -ex
#
docker build -t irinabov/docker-qpid-dispatch-router . | tee build-latest.log
exit

