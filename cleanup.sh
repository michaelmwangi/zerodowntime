#! /bin/sh

echo "Removing nodes"
docker rm -f haproxy.org
docker rm -f ansible.org
docker rm -f app1.org
docker rm -f app2.org
echo "Removing network"
docker network remove kang