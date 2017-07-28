FROM mhart/alpine-node:8.2.1

LABEL maintainer="Code Computerlove"

RUN \
  # Dependencies
  apk update && \
  apk upgrade && \
  apk add --update --no-cache --repository https://dl-3.alpinelinux.org/alpine/edge/testing \
      make \
      grep \
      vips \
      vips-dev \
      fftw-dev \
      g++ \
      git \
      python \
      bash \
      chromium && \
  rm -rf /var/cache/apk/*
  
ENV CHROME_PATH="/usr/bin/chromium-browser"
ENV BACKSTOPJS_VERSION="beta"

RUN \
  # BackstopJS
  echo "Installing BackstopJS v${BACKSTOPJS_VERSION}" && \
  yarn global add backstopjs@${BACKSTOPJS_VERSION}

WORKDIR /src

ENTRYPOINT ["backstop"]