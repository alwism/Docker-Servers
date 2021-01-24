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
        curl \
        tar \
        locales \
    ; \
    apt-get clean autoclean; \
    apt-get -y autoremove; \
    rm -rf /var/lib/apt/lists/*; \
    locale-gen en_US.UTF-8; \
    update-locale

WORKDIR /Steam

RUN  curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -;

RUN ./steamcmd.sh +login anonymous +app_update 1026340 validate +quit

#CMD ./steamcmd.sh +login anonymous +app_run 1026340
CMD tail -f /dev/null
