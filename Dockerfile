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
ARG OBS_STUDIO_VERSION=28.1.*
RUN add-apt-repository ppa:obsproject/obs-studio \
    && apt-get install -y obs-studio=${OBS_STUDIO_VERSION}*

# Configure OBS Web Socket
ENV OBS_PORT 4455
ENV OBS_PASS password

# Start OBS with specified websocket port and password
CMD xvfb-run obs --websocket_password=${OBS_PASS} --websocket_port=${OBS_PORT}