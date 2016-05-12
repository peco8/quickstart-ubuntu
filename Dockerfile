FROM ubuntu:trusty

RUN apt-get update

RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd

ADD start.sh /start.sh
RUN chmod +x /*.sh

ENV AUTHORIZED_KEY none

EXPOSE 22
CMD ["./start.sh", "-bash"]
