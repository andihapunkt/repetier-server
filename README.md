# repetier-server
Repetier-Server V0.93.1 für Raspberry PI debian:buster-slim
im Docker Container

Es kann ein SAMBA-Server gestartet werden. Dann können gcodes direkt vom PC/MAC auf dem Repetier-Server (Container) abgelegt werden.
Freigabe "Objekte" (/data/share)

#Aufruf:
$ docker volume create repetier_share

docker run -it -p 3344:3344 -p 139:139 -p 445:445 \
-v /docker/repetier/configs:/data/configs \
-v /docker/repetier/licenses:/data/licenses \
-v /docker/repetier/logs:/data/logs \
-v /docker/repetier/lua:/data/lua \
-v /docker/repetier/printer:/data/printer \
-v /docker/repetier/projects:/data/projects \
-v /docker/repetier/reports:/data/reports \
-v /docker/repetier/tmp:/data/tmp \
-v repetier_share:/data/share \
--privileged --restart=always --name repserver repetierserver



Version 1.1   SAMBA Server kann im Repetier-Server (Einstellungen) gestartet werden.

Version: 1.0  Repetier-Server mit SAMBA-Freigabe (/data/share) um dort die gcodes abzulegen. SAMBA muss manuell gestartete werden.

v.0.93.1 Standard Installation Repetier-Server 0.93.1
