FROM docker:latest
MAINTAINER Jesse DeFer <docker-compose@dotd.com>

RUN apk add --no-cache --update git openssh-client py-pip
RUN adduser -D -u 1000 -G 513 jenkins

RUN mkdir -p /home/jenkins/.ssh && chmod 0700 /home/jenkins/.ssh && echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> /home/jenkins/.ssh/config && chmod 0600 /home/jenkins/.ssh/config && chown -R jenkins:jenkins /home/jenkins/.ssh

RUN pip install docker-compose

ENTRYPOINT ["/usr/bin/docker-compose"]
