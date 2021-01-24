FROM ubuntu

RUN set -x \
  dpkg --add-architecture i386; \
  apt-get update; \
  apt-get -y upgrade; \
  apt-get -y install --no-install-recommends --no-install-suggests \
    lib32gcc1 \
    lib32stdc++6 \
    ca-certificates \
    libsdl2-2.0-0 \
    curl \
  ; \
  apt-get clean autoclean; \
  apt-get -y autoremove; \
  rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US; \
    locale-gen en_US.UTF-8; \
    update-locale

WORKDIR ~/Steam

RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxf -

RUN ./steamcmd.sh +login anonymous +app_update 602960 validate +quit

RUN ln -s ~/Steam/linux64/steamclient.so ~/Steam/steamapps/common/Barotrauma\ Dedicated\ Server/lib64/steamclient.so; \
    ln -s /root/Steam/logs/stderr.txt /dev/stderr

RUN ./steamcmd.sh +login anonymous +app_update 1026340 validate +quit

#CMD ./steamcmd.sh +login anonymous +app_run 1026340
CMD tail -f /dev/null
