# Based on ubuntu:20.04
FROM ubuntu@sha256:aba80b77e27148d99c034a987e7da3a287ed455390352663418c0f2ed40417fe

RUN apt update 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN apt-get install -y software-properties-common
RUN apt install -y ffmpeg 
RUN add-apt-repository ppa:obsproject/obs-studio
RUN apt install -y obs-studio
COPY obs-websocket-plugin obs-websocket-plugin
RUN mv obs-websocket-plugin/**.deb obs-websocket-plugin/plugin.deb
RUN apt install -y ./obs-websocket-plugin/plugin.deb
CMD /bin/bash