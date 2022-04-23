FROM node:16.14.0-alpine

ARG UPSTREAM_VERSION

WORKDIR /usr/local

ENV PATH="${PATH}:/usr/local/hsd/bin:/usr/local/hsd/.bin"

RUN apk add --no-cache bash=5.1.16-r0 unbound-dev=1.13.2-r2 gmp-dev=6.2.1-r1 g++=10.3.1_git20211027-r0 gcc=10.3.1_git20211027-r0 make=4.3-r0 python2=2.7.18-r4 curl

RUN curl -L https://github.com/handshake-org/hsd/archive/refs/tags/${UPSTREAM_VERSION}.tar.gz -o hsd.tar.gz && tar xvf hsd.tar.gz && mv hsd-${UPSTREAM_VERSION#v} hsd && rm hsd.tar.gz

WORKDIR /usr/local/hsd

RUN npm install --production

ADD bin/docker_entrypoint.sh /

ENTRYPOINT ["/docker_entrypoint.sh"]
