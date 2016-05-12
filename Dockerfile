FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update
RUN apt-get install -yqq openssh-server

RUN mkdir -p /var/run/sshd

ADD start.sh /start.sh
RUN chmod +x /start.sh

RUN echo 'root:root' |chpasswd

RUN sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config

ENV AUTHORIZED_KEY none

EXPOSE 22
CMD ["./start.sh", "-bash"]
