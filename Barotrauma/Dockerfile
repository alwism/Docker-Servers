FROM ubuntu

RUN set -x \
  add-apt-repository multiverse; \
  dpkg --add-architecture i386; \
  apt-get update; \
  apt-get -y upgrade; \
  apt-get -y install \
    lib32gcc1 \
    steamcmd \
  ; \
  apt-get clean autoclean; \
  apt-get -y autoremove; \
  rm -rf /var/lib/apt/lists/*

WORKDIR ~/Steam

RUN steamcmd +login anonymous +app_update 602960 validate +quit

RUN steamcmd +login anonymous +app_update 1026340 validate +quit

#CMD steamcmd +login anonymous +app_run 1026340
CMD tail -f /dev/null
