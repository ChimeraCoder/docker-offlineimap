FROM debian:wheezy
MAINTAINER Aditya Mukerjee <dev@chimeracoder.net>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update --fix-missing
RUN apt-get install -y bash 
RUN apt-get install -y wget
RUN apt-get install -y -o Acquire::ForceIPv4=true offlineimap ca-certificates


RUN useradd -m offlineimap
ADD offlineimaprc /home/offlineimap/.offlineimaprc

RUN chown offlineimap:offlineimap /home/offlineimap/.offlineimaprc

RUN mkdir /home/offlineimap/mail
RUN chown -R offlineimap:offlineimap /home/offlineimap/mail

USER offlineimap


# Use exec mode so offlineimap can receive SIGUSR2
ENTRYPOINT ["/usr/bin/offlineimap", "-c", "/home/offlineimap/.offlineimaprc"]
