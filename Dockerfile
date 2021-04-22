FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-bionic

RUN \
   apt-get update \
      && apt-get install -y --no-install-recommends \
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
