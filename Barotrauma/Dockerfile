FROM debian

RUN mkdir -p /root/Steam/logs; \
    ln -s /dev/stderr /root/Steam/logs/stderr.txt

RUN set -x \
    dpkg --add-architecture i386; \
    DEBIAN_FRONTEND=noninteractive && apt-get update; \
    apt-get -y upgrade; \
    DEBIAN_FRONTEND=noninteractive && apt-get -y install \
        bzip2 \
        libarchive13 \
        locales \
        lib32gcc1 \
        lib32stdc++6 \
        ca-certificates \
        libsdl2-2.0-0 \
        icu-devtools \
        curl \
        tar \
    ; \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen; \
    locale-gen --no-purge en_US.UTF-8; \
    apt-get clean autoclean; \
    apt-get -y autoremove; \
    rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
    
WORKDIR /Steam

RUN  curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -;

RUN ./steamcmd.sh +login anonymous +app_update 1026340 validate +quit

RUN ln -s /root/Steam/steamapps steamapps; \
    ln -s steamapps/common/Barotrauma\ Dedicated\ Server/Submarines Submarines; \
    ln -s steamapps/common/Barotrauma\ Dedicated\ Server/Mods Mods; \
    ln -s steamapps/common/Barotrauma\ Dedicated\ Server/serversettings.xml config;

COPY ./entry.sh entry.sh

RUN chmod +x entry.sh

#ENTRYPOINT ./entry.sh

CMD tail -f /dev/null
