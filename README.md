![Latest/Nightly](https://github.com/obs-websocket-community-projects/obs-websocket-docker/actions/workflows/docker-latest.yml/badge.svg)

# OBS-Websocket-Docker

Docker image that runs OBS with Palakis OBS Websocket installed.

**Only obs-websocket version 5.0.0 and higher is supported.**
**This uses the ubuntu / amd64 distribution**

You can use this in GitHub Actions or your local PC, but it may not work on your Raspberry Pi.

## Running

To start the container with generic docker:

```
docker run -p 4455:4455 obs-websocket-community/docker:latest
```

A compose file is also available in this repository as an example:

```
docker-compose up
```

The compose-file will run the latest image of `obs-websocket-community/docker:latest`, with the default build args and environment variables (see [Configuration](#Configuration)).

To take down the docker-compose container:

```
docker-compose down

# Optionally remove built image so you can rebuild it
docker-compose down --rmi local
```

## Configuration

### Environment Variables

| Env Variable | Description                                         | Default  |
| ------------ | --------------------------------------------------- | -------- |
| OBS_PORT     | Port where obs-websocket listens for connections.\* | 4455     |
| OBS_PASS     | Password for authenticating against obs-websocket   | password |

\*Remember to expose the port too, e.g. `docker run -e OBS_PORT=4545 -p 4545:4545 ...`

### Build Arguments

| Build Argument     | Description             | Default        |
| ------------------ | ----------------------- | -------------- |
| OBS_STUDIO_VERSION | Version of OBS Studio\* | See Dockerfile |

\* You can search available versions in Ubuntu via `apt list -a obs-studio`

## Known Issues

- obs-websocket cannot be configured with authentication disabled; this is not currently a feature in 5.x (providing a blank password does not disable authentication).

## Building

### Automated Builds

CI/CD Runs daily, at midnight.
Tag format is `obs-websocket-community/docker:$timestamp`.

### Manual Builds

```
docker build -t obswebsocket-local .
docker run -p 4455:4455 obswebsocket-local
```
