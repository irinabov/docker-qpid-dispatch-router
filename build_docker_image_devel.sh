#!/bin/bash -ex
#
docker build --build-arg version=devel -t irinabov/docker-qpid-dispatch-router:devel . | tee build-devel.log
exit

