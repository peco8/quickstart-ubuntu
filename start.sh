#!/bin/bash

if [ "$AUTHORIZED_KEY" != "none" ]; then
    echo "=> Found authorized keys"
    mkdir -p /root/.ssh
    chmod 700 /root/.ssh
    touch /root/.ssh/authorized_keys
    chmod 600 /root/.ssh/authorized_keys

    echo "$AUTHORIZED_KEY" >> /root/.ssh/authorized_keys
fi

/usr/sbin/sshd -D
