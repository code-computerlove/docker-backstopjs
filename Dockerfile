FROM mhart/alpine-node:8.2.1

LABEL maintainer="Code Computerlove"

RUN \
  # Dependencies
  apk update && \
  apk upgrade && \
  apk add --update --no-cache --repository https://dl-3.alpinelinux.org/alpine/edge/testing \
      make \
      vips \
      vips-dev \
      fftw-dev \
      g++ \
      git \
      python \
      bash && \
  rm -rf /var/cache/apk/*

RUN \
  # BackstopJS
  echo "Installing BackstopJS" && \
  yarn global add backstopjs@beta

WORKDIR /src

ENTRYPOINT ["backstop"]