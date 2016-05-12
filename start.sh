#!/bin/bash

if [ "$AUTHORIZED_KEY" != "none" ]; then
    mkdir -p /root/.ssh
    chmod 600 /root/.ssh
    touch /root/.ssh/authorized_keys
    chmod 600 /root/.ssh/authorized_keys
    echo "$AUTHORIZED_KEY" >> /root/.ssh/authorized_keys

    # Configure sshd.conf
    ## Only pubkey authentication
    sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config
    sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
fi

/usr/sbin/sshd -D
