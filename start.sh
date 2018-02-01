#! /bin/sh
echo "#############################Preparing the haproxy node###################################"
docker pull haproxy
echo "#############################Preparing the ansible control node#############################"
pushd ansible
docker build . -t ansibleimg
popd -1
pushd app
echo "#############################Preparing the webapp image node#############################"
docker build . -t webapp
popd -1
echo "#############################Creating the network#############################"
docker network create kang
echo "#############################Starting haproxy node#############################"
docker run -ti -d --network=kang --name=haproxy.org  haproxy tail -f /dev/null
echo "#############################Starting ansible node#############################"
docker run -ti -d --network=kang --name=ansible.org ansibleimg
echo "#############################Starting webappnode 1#############################"
docker run -ti -d --network=kang --name=app1.org webapp
echo "#############################Starting webappnode 2#############################"
docker run -ti -d --network=kang --name=app2.org webapp