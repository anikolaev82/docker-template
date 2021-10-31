ARG VERSION=latest
FROM ubuntu:${VERSION}
LABEL DESCRIPTION="Dockerfile template"
ENV PATH_ROOT=/home/$USER/app
VOLUME ["/www"]
WORKDIR ${PATH_ROOT}
RUN mkdir src app
COPY *.py ${PATH_ROOT}
RUN apt-get update && echo "Hello docker"
EXPOSE 5000/tcp
