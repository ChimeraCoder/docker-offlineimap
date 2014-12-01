FROM debian:wheezy
MAINTAINER Aditya Mukerjee <dev@chimeracoder.net>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update --fix-missing
RUN apt-get install -y bash 
RUN apt-get install -y wget
RUN apt-get install -y -o Acquire::ForceIPv4=true offlineimap 


RUN useradd -m offlineimap
ADD offlineimaprc /home/offlineimap/.offlineimaprc
RUN sed -i "s/remoteuser = YOUR_EMAIL_ADDRESS@gmail.com/remoteuser = $EMAIL/" offlineimaprc
RUN sed -i "s/remotepass= YOUR_PASSWORD_HERE/remotepass = $PASSWORD/" offlineimaprc

RUN chown offlineimap:offlineimap /home/offlineimap/.offlineimaprc

RUN chown -R offlineimap:offlineimap /home/offlineimap/mail

USER offlineimap


# Use exec mode so offlineimap can receive SIGUSR2
ENTRYPOINT ["/usr/bin/offlineimap"]
