FROM alpine:3.12

ARG SOFTHSMV2_VERSION=2.6.1

LABEL maintainer="Carlos Remuzzi <carlosremuzzi@gmail.com>"
LABEL version=${SOFTHSMV2_VERSION}

RUN apk add --no-cache \
    openssl \
  && apk add --no-cache --virtual .build-deps \
    autoconf \
    automake \
    build-base \
    libtool \
    openssl-dev \
  && wget -O SoftHSMv2.tar.gz \
    https://github.com/opendnssec/SoftHSMv2/archive/${SOFTHSMV2_VERSION}.tar.gz \
  && tar -xf SoftHSMv2.tar.gz \
  && cd SoftHSMv2-${SOFTHSMV2_VERSION} \
  && ./autogen.sh \
  && ./configure \
  && make \
  && make install

CMD ["softhsm2-util","--help"]
