FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-bionic

ENV LABEL_MAINTAINER="Martinus Suherman" \
    LABEL_VENDOR="martinussuherman" \
    LABEL_IMAGE_NAME="martinussuherman/alpine-tz-ep" \
    LABEL_URL="https://hub.docker.com/r/martinussuherman/alpine-tz-ep/" \
    LABEL_VCS_URL="https://github.com/martinussuherman/alpine-tz-ep" \
    LABEL_DESCRIPTION="Alpine Linux based image that bundles tzdata, su-exec, and some useful entrypoint scripts." \
    LABEL_LICENSE="MIT"

RUN apt-get update && \
    apt-get -y install xvfb && \
    apt-get -y install fontconfig && \
    apt-get -y install libssl1.0-dev && \
    apt-get -y install libx11-dev \
                       libx11-xcb-dev \
                       libxcb-icccm4-dev \
                       libxcb-image0-dev \
                       libxcb-keysyms1-dev \
                       libxcb-randr0-dev \
                       libxcb-render-util0-dev \
                       libxcb-render0-dev \
                       libxcb-shm0-dev \
                       libxcb-util0-dev \
                       libxcb-xfixes0-dev \
                       libxcb-xkb-dev \
                       libxcb1-dev \
                       libxfixes-dev \
                       libxrandr-dev \
                       libxrender-dev

#
ARG LABEL_VERSION="latest"
ARG LABEL_BUILD_DATE
ARG LABEL_VCS_REF

# Build-time metadata as defined at http://label-schema.org
LABEL maintainer=$LABEL_MAINTAINER \
      org.label-schema.build-date=$LABEL_BUILD_DATE \
      org.label-schema.description=$LABEL_DESCRIPTION \
      org.label-schema.name=$LABEL_IMAGE_NAME \
      org.label-schema.schema-version="1.0" \
      org.label-schema.url=$LABEL_URL \
      org.label-schema.license=$LABEL_LICENSE \
      org.label-schema.vcs-ref=$LABEL_VCS_REF \
      org.label-schema.vcs-url=$LABEL_VCS_URL \
      org.label-schema.vendor=$LABEL_VENDOR \
      org.label-schema.version=$LABEL_VERSION
