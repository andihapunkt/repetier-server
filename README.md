# repetier-server
Repetier-Server V0.93.1 für Raspberry PI debian:buster-slim
im Docker Container

Es kann ein SAMBA-Server gestartet werden. Dann können gcodes direkt vom PC/MAC auf dem Repetier-Server (Container) abgelegt werden.
Freigabe "Objekte" (/data/share)

#Aufruf:
$ docker run -it -p 3344:3344 -v /docker/repetier:/data --privileged --restart=always --name repetier-server andihapunkt/repetier-server:tag

Version 1.1   SAMBA Server kann im Repetier-Server (Einstellungen) gestartet werden.

Version: 1.0  Repetier-Server mit SAMBA-Freigabe (/data/share) um dort die gcodes abzulegen. SAMBA muss manuell gestartete werden.

v.0.93.1 Standard Installation Repetier-Server 0.93.1
