FROM ubuntu

RUN set -x \
  add-apt-repository multiverse; \
  dpkg --add-architecture i386; \
  apt-get update; \
  apt-get -y upgrade; \
  apt-get -y install \
    git \
    lib32gcc1 \
  ; \
  apt-get clean autoclean; \
  apt-get -y autoremove; \
  rm -rf /var/lib/apt/lists/*

WORKDIR ~/Steam

RUN git clone https://aur.archlinux.org/steamcmd.git

WORKDIR ~/Steam/steamcmd

#RUN steamcmd +login anonymous +app_update 602960 validate +quit

#RUN steamcmd +login anonymous +app_update 1026340 validate +quit

#CMD steamcmd +login anonymous +app_run 1026340
CMD tail -f /dev/null
