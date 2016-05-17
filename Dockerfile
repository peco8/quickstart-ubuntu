# Using official php runtime base image
FROM ubuntu:trusty

MAINTAINER "Toshiki Inami <t-inami@arukas.io>"

# ENV DEBIAN_FRONTEND noninteractive

# Set username/password login as a default
# public authentication will be enabled with AUTHORIZED_KEY ENV
ENV AUTHORIZED_KEY none

# Install openssh-server, and then clean up
RUN apt-get update -q && \
    apt-get install -y -qq  openssh-server && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/run/sshd

# Make start.sh excutable
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Set the root password for demo
RUN echo 'root:root' | chpasswd

# Enable Rootlogin and PasswordAuth
RUN sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config

# Expose 22 for SSH access
EXPOSE 22

# Start supervisord to controll processes
CMD ["./start.sh", "-bash"]
