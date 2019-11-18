#!/bin/sh

if [ -f /ssh/id_rsa ]; then
    mkdir -p ~/.ssh/
    cp /ssh/id_rsa ~/.ssh/id_rsa
    chmod 600 ~/.ssh/id_rsa
else
    echo "> No SSH key mounted in /ssh/id_rsa"
fi

if [ -f /ssh/id_rsa.pub ]; then
    mkdir -p ~/.ssh/
    cp /ssh/id_rsa.pub ~/.ssh/id_rsa.pub
    chmod 600 ~/.ssh/id_rsa.pub
else
    echo "> No public SSH key mounted in /ssh/id_rsa.pub"
fi

exec "$@"