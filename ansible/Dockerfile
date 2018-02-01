FROM ubuntu:16.04
MAINTAINER Michael Mwangi

RUN apt-get update && apt-get install -y software-properties-common && apt-add-repository ppa:ansible/ansible && apt-get install -y python openssh-server ansible iputils-ping
RUN mkdir ~/.ssh && ssh-keygen -N "" -t rsa -f ~/.ssh/id_rsa
RUN apt-get install -y sshpass
COPY simulate.sh /simulate.sh
COPY haproxy.yml  /haproxy.yml
COPY hosts /hosts
COPY templates /templates

WORKDIR /root

CMD /simulate.sh