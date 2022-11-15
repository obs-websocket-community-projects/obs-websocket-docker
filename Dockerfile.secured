# Based on ubuntu latest LTS
FROM ubuntu:latest

# Install dependencies
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y update \ 
    && apt-get install -y \
        tzdata \
        software-properties-common \
        ffmpeg \
        xvfb

# Install OBS
ARG OBS_STUDIO_VERSION=28.*
RUN add-apt-repository ppa:obsproject/obs-studio \
    && apt-get install -y obs-studio=${OBS_STUDIO_VERSION}

# Configure OBS Web Socket
ENV OBS_PORT 4455
ENV OBS_PASS password

# Override OBS Web Socket config
COPY global.ini /root/.config/obs-studio/

# Start OBS with specified websocket port and password
CMD xvfb-run -a obs --websocket_password=${OBS_PASS} --websocket_port=${OBS_PORT}