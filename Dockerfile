FROM fedora:latest
ARG version
ARG proton
ARG dispatch
ENV VERSION=${version:-latest} \
    NAME=docker-qpid-dispatch-router \
    QPID_PROTON_VERSION=${proton:-0.17.0} \
    QPID_DISPATCH_VERSION=${dispatch:-0.8.0}
LABEL maintainer="Irina Boverman <irina.boverman@gmail.com>" \
      summary="Docker image for Qpid Dispatch router." \
      name="irinabov/$NAME" \
      version="$VERSION" \
      version-usage="version has 2 values: latest (released proton $QPID_PROTON_VERSION and dispatch $QPID_DISPATCH_VERSION) or devel (under development)" \
      usage1="docker run -d -p 5672:5672 irinabov/docker-qpid-dispatch-router" \
      usage2="docker run -p 5672:5672 irinabov/docker-qpid-dispatch-router --help" \
      usage3="Customize container execution using your own version of a config file"

# Install all dependencies, build from source, install qpid-cpp components
COPY ./build.sh /
RUN ./build.sh

VOLUME /etc/qpid-dispatch
EXPOSE 5671 5672
ENTRYPOINT ["/usr/sbin/qdrouterd"]
