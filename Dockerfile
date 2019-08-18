FROM ubuntu:18.04

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="" \
      org.label-schema.description="Docker container with gcc 8, cmake and other stuff" \
      org.label-schema.url="https://github.com/youmych/docker-ivesdk.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/youmych/docker-ivesdk.git" \
      org.label-schema.vendor="YA" \
      maintainer="youmych@yandex.ru"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y gcc g++ binutils cmake git doxygen graphviz && \
    rm -rf /var/cache/apt/* && \
    adduser -D -s /usr/bin/bash sdk

CMD [ "/usr/bin/bash" ]

USER sdk
WORKDIR /home/sdk
