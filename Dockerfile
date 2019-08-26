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
    apt-get install -y apt-utils && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y gcc-8 g++-8 binutils \
        make cmake doxygen graphviz \
        libavcodec-dev libavdevice-dev \
        libavfilter-dev libavresample-dev \
        libavutil-dev libswscale-dev \
        libswresample-dev libasound2-dev \
        libgdbm-compat4 libgdbm5 libperl5.26 netbase perl-modules-5.26 && \
    rm -rf /var/cache/apt/* && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 50 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 50 && \
    mkdir -p /opt/project
#    adduser sdk --home /home/sdk --shell /usr/bin/bash 

CMD [ "/bin/bash" ]

#USER root
WORKDIR /opt/project
