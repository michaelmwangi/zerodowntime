FROM jfloff/alpine-python:recent-onbuild
MAINTAINER Michael Mwangi
RUN apk add --no-cache  openssh 
RUN mkdir /root/.ssh
ADD . /appcode
WORKDIR /appcode
CMD /appcode/start.sh