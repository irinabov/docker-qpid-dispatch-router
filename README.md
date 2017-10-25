# docker-qpid-dispatch-router

Docker image for Apache Qpid Dispatch router based on fedora:latest image. 
Customize container execution using your own version of a config file.

## Building images

Build arguments:
  version, proton and dispatch.

  version has 2 values:

  - latest (default), builds an image from latest released tags for qpid proton and
    and qpid dispach git source

  - devel, builds an image from branch master for qpid proton and qpid dispach 
    git source, you may need to change the build script to account for recent
    changes

  proton and dispatch values are tags for released versions of qpid proton and qpid dispatch
  in the git source.

Examples:

Build the image using latest released versions of proton and dispatch (defined by Dockerfile):
  - docker build -t irinabov/docker-qpid-dispatch-router . | tee build.log

Build the image using snapshot of upstream code:
  - docker build --build-arg version=devel -t irinabov/docker-qpid-dispatch-router:devel . | tee build.log
  
Build the image using latest released versions of proton and dispatch (defined by build arguments):
 - docker build --build-arg proton=0.18.0 --build-arg dispatch=0.8.0 -t irinabov/docker-qpid-dispatch-router . | tee build.log

## Using the image

Examples:

Get help:
  - docker run --rm -p 5672:5672 irinabov/docker-qpid-dispatch-router --help

Run docker as a daemon in a test container:
  - docker run -d -p 5672:5672 --name test irinabov/docker-qpid-dispatch-router

While test container is running, query router:
  - docker exec test qdstat -a

Try "qdmanage --help":
  - docker exec test qdmanage --help
