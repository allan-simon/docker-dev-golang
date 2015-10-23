#!/bin/bash

if ! command -v docker &>/dev/null; then
    >&2 echo "Docker is not installed"
    exit 1
fi

if ! groups | grep '\bdocker\b' --only-matching &>/dev/null ; then 
    >&2 echo "Current user is not member of docker group"
    exit 2
fi

if ! command -v ansible &>/dev/null ; then
    >&2 echo "Ansible is not installed"
    exit 3
fi

if ! command -v vagrant &>/dev/null; then
    >&2 echo "Vagrant is not installed"
    exit 4
fi

vagrant destroy --force && vagrant up --provider docker

# name of the docker container given by vagrant
#
# vagrant store the id of the docker image, that we use
# to get the image name from docker ps
VAGRANT_NAME=$(
    docker ps |
    grep  $(<.vagrant/machines/default/docker/docker_build_image) |
    grep -e '[^ ]*$' --only-matching
)


# we name the container so that we can reuse it
docker commit "$VAGRANT_NAME" go_vim_docker

echo -e "\n\n\n\n\n"
echo "container go_vim_docker created, you now can either do :"
echo " * vagrant ssh => if you just need one environment"
echo " * docker run -d --name YOUR_PROJECT -p YOUR_LOCAL_PORT:22 go_vim_docker => if you need one env by project"
echo -e "\n\n\n\n\n"

