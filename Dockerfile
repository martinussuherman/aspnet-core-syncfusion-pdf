FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-bionic

ENV \
   # container/gosu UID \
   EUID=1001 \
   # container/gosu GID \
   EGID=1001 \
   # container/gosu user name \
   EUSER=docker-user \
   # container/gosu group name \
   EGROUP=docker-group \
   # container user home dir \
   EHOME= \
   # should user created/updated to use nologin shell? (yes/no) \
   ENOLOGIN=yes \
   # should user home dir get chown'ed? (yes/no) \
   ECHOWNHOME=no \
   # additional directories to create + chown (space separated) \
   ECHOWNDIRS= \
   # additional files to create + chown (space separated) \
   ECHOWNFILES= \
   # container timezone \
   TZ=UTC

RUN \
   ln -fs /usr/share/zoneinfo/UTC /etc/localtime \
   && DEBIAN_FRONTEND=noninteractive \
   && apt-get update \
      && apt-get install -y --no-install-recommends \
      tzdata \
      gosu \
      xvfb \
      fontconfig \
      libssl1.0-dev \
      libx11-dev \
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
      libxrender-dev \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/*

COPY \
   chown-path \
   set-user-group-home \
   entrypoint-crond \
   entrypoint-exec \
   entrypoint-gosu \
   /usr/bin/

RUN \
   chmod +x \
   /usr/bin/chown-path \
   /usr/bin/set-user-group-home \
   /usr/bin/entrypoint-crond \
   /usr/bin/entrypoint-exec \
   /usr/bin/entrypoint-gosu
