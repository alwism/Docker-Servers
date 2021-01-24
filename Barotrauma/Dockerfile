FROM ubuntu

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install lib32gcc1 curl

WORKDIR ~/Steam 

RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxf -
RUN ln -s ~/Steam/linux64/steamclient.so ~/Steam/steamapps/common/Barotrauma\ Dedicated\ Server/lib64/steamclient.so

RUN ./steamcmd.sh +login anonymous +app_update 602960 validate +quit
RUN ./steamcmd.sh +login anonymous +app_update 1026340 validate +quit

#CMD ./steamcmd.sh +login anonymous +app_run 1026340
CMD tail -f /dev/null
