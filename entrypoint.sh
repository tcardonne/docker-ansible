#!/bin/sh

if [ -f /ssh/id_rsa ]; then
    mkdir -p ~/.ssh/
    cp /ssh/id_rsa ~/.ssh/id_rsa
    chmod 600 ~/.ssh/id_rsa
else
    echo "> No SSH key mounted in /ssh/id_rsa"
fi

exec "$@"