# How to use this image

## Quickstart

1. First run a simple container

```sh
docker run --name softhsm -i -t cremuzzi/softhsm2 ash
```

2. then initialize a new token

from the container's interactive shell:

```sh
softhsm2-util --init-token --slot 0 --label "My token 1"
```

## Start with persistent storage


1. Create a data directory on a suitable volume on your host system, e.g. `/my/own/tokens`

2. Start your `softhsm` container like this:

```sh
docker run --name softhsm -i -t -v /my/own/tokens:/tokens cremuzzi/softhsm2 ash
```

For more information on SoftHSMv2 please visit the main project on [https://github.com/opendnssec/SoftHSMv2](https://github.com/opendnssec/SoftHSMv2)
