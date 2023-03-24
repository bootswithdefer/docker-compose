FROM docker:latest
MAINTAINER Jesse DeFer <docker-compose@dotd.com>

RUN apk add --no-cache --update git openssh-client py-pip
RUN addgroup -g 1000 jenkins && addgroup -g 513 docker && adduser -D -u 1000 -g 1000 -G docker jenkins

RUN ssh-keyscan github.com > /etc/ssh/ssh_known_hosts

RUN pip install docker-compose
