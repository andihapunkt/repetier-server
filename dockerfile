FROM debian:buster-slim

LABEL version="1.1"

RUN apt-get update && apt-get upgrade -y

ADD http://download.repetier.com/files/server/debian-armel/Repetier-Server-0.93.1-Linux.deb repetier-server.deb

RUN dpkg --unpack repetier-server.deb \
    && rm -rf repetier-server.deb \
    && rm -f /var/lib/dpkg/info/repetier-server.postinst

RUN mkdir -p /data \
    && sed -i "s/var\/lib\/Repetier-Server/data/g" /usr/local/Repetier-Server/etc/RepetierServer.xml

#SAMBA installieren
RUN apt-get install nano -y
RUN apt-get install samba samba-common smbclient -y
RUN mkdir -p /data/share
RUN mkdir -p /data/smb_start
RUN chmod 777 /data/share/
RUN mv /etc/samba/smb.conf /etc/samba/smb.conf_alt
ADD https://raw.github.com/andihapunkt/repetier-server/master/skript/smb.conf /etc/samba/smb.conf
ADD https://raw.github.com/andihapunkt/repetier-server/master/skript/smb_start.sh /data/smb_start/smb_start.sh
ADD https://raw.github.com/andihapunkt/repetier-server/master/skript/extcommands.xml /data/database/extcommands.xml
RUN chmod +x /data/smb_start/smb_start.sh


EXPOSE 139 445 3344

CMD [ "/usr/local/Repetier-Server/bin/RepetierServer", "-c", "/usr/local/Repetier-Server/etc/RepetierServer.xml" ]
