FROM debian

RUN set -x \
    dpkg --add-architecture i386; \
    apt-get update; \
    apt-get -y upgrade; \
    apt-get -y install \
        lib32gcc1 \
        lib32stdc++6 \
        ca-certificates \
        libsdl2-2.0-0 \
        curl \
        tar \
    ; \
    apt-get clean autoclean; \
    apt-get -y autoremove; \
    rm -rf /var/lib/apt/lists/*

RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update && apt-get install -y \
        bzip2 ca-certificates curl libarchive13 lib32gcc1 locales p7zip-full tar unzip wget && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
        locale-gen --no-purge en_US.UTF-8 && \
    apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*;

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
    
WORKDIR /Steam

RUN  curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -;

RUN ./steamcmd.sh +login anonymous +app_update 1026340 validate +quit

#CMD ./steamcmd.sh +login anonymous +app_run 1026340
CMD tail -f /dev/null
