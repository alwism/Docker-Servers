FROM debian

RUN set -x \
  dpkg --add-architecture i386; \
  apt-get update; \
  apt-get -y upgrade; \
  apt-get -y install \
    git \
    lib32gcc1 \
    lib32stdc++6 \
    ca-certificates \
    libsdl2-2.0-0 \
    wget \
    tar \
    language-pack-en \
  ; \
  apt-get clean autoclean; \
  apt-get -y autoremove; \
  rm -rf /var/lib/apt/lists/*

WORKDIR /Steam

RUN  wget -qO- 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar xvzf -;

RUN steamcmd +login anonymous +app_update 602960 validate +quit

RUN steamcmd +login anonymous +app_update 1026340 validate +quit

#CMD steamcmd +login anonymous +app_run 1026340
CMD tail -f /dev/null
