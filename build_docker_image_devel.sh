#!/bin/bash -ex
#
docker build --build-arg version=devel -t irinabov/docker-qpid-dispatch-router:devel . > ../build-devel.log 2>&1
exit

