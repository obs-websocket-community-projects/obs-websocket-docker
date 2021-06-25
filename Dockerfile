# Based on ubuntu:20.04
FROM ubuntu@sha256:aba80b77e27148d99c034a987e7da3a287ed455390352663418c0f2ed40417fe

# Install dependencies
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y update \ 
    && apt-get install -y \
        tzdata \
        software-properties-common \
        ffmpeg \
        xvfb

# Install OBS
ARG OBS_STUDIO_VERSION=27.0.1
RUN add-apt-repository ppa:obsproject/obs-studio \
    && apt-get install -y obs-studio=${OBS_STUDIO_VERSION}*

# Copy the Ubuntu package into the container, and install it
COPY obs-websocket-plugin obs-websocket-plugin
RUN mv obs-websocket-plugin/**.deb obs-websocket-plugin/plugin.deb
RUN apt install -y ./obs-websocket-plugin/plugin.deb

ENV OBS_PORT 4444
ENV OBS_PASS password

# Start OBS with specified websocket port and password
CMD xvfb-run obs --websocket_password=${OBS_PASS} --websocket_port=${OBS_PORT}