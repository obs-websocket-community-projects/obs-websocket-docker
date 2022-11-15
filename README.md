![Latest/Nightly](https://github.com/obs-websocket-community-projects/obs-websocket-docker/actions/workflows/docker-latest.yml/badge.svg)

# OBS-Websocket-Docker

Docker image that runs OBS with Palakis OBS Websocket installed.

**Only obs-websocket version 5.0.0 and higher is supported.**
**This uses the ubuntu / amd64 distribution**

You can use this in GitHub Actions or your local PC, but it may not work on your Raspberry Pi.

## Running

To start the container with generic docker:

```sh
docker run -p 4455:4455 obswebsocketcommunity/docker:latest
```

A compose file is also available in this repository as an example:

```sh
docker-compose up
```

The compose-file will run the latest image of `obswebsocketcommunity/docker:latest`, with the default build args and environment variables (see [Configuration](#Configuration)).

To take down the docker-compose container:

```sh
docker-compose down

# Optionally remove built image so you can rebuild it
docker-compose down --rmi local
```

## Configuration

### Environment Variables

| Env Variable | Description                                         | Default    |
| ------------ | --------------------------------------------------- | ---------- |
| OBS_PORT     | Port where obs-websocket listens for connections.\* | `4455`     |
| OBS_PASS     | Password for authenticating against obs-websocket   | `password` |

\*Remember to expose the port too, e.g. `docker run -e OBS_PORT=4545 -p 4545:4545 ...`

### Build Arguments

| Build Argument     | Description             | Default |
| ------------------ | ----------------------- | ------- |
| OBS_STUDIO_VERSION | Version of OBS Studio\* | `28.*`  |

\* You can search available versions in Ubuntu via `apt list -a obs-studio`

## Building

### Automated Builds

CI/CD Runs daily, at midnight.
The images are the following:
- OBS WebSocket Authentication Enabled
  - `obswebsocketcommunity/docker:latest`
  - `obswebsocketcommunity/docker:$timestamp` 
- OBS WebSocket Authentication Disabled
  - `obswebsocketcommunity/docker:latest-unsecured`
  - `obswebsocketcommunity/docker:$timestamp-unsecured`

### Manual Builds

Using build_local.sh you can build a local image.

Usage:

```sh
./build_local.sh [--unsecured] [obs_version] [repository] [tag]
```

Options:
| Option        | Description             | Default                        |
| ------------- | ----------------------- | ------------------------------ |
| `--unsecured` | Disable authentication  |                                |
| `obs_version` | OBS version\*           | `28.*`                         |
| `repository`  | Docker image repository | `obswebsocket-local`           |
| `tag`         | Docker image tag        | `latest` or `latest-unsecured` |

\* You can search available versions in Ubuntu via `apt list -a obs-studio`

#### Authentication enabled

```sh
./build_local.sh
docker run -p 4455:4455 obswebsocket-local:latest
```

#### Authentication disabled

```sh
./build_local.sh --unsecured
docker run -p 4455:4455 obswebsocket-local:latest-unsecured
```

#### Different OBS version

```sh
./build_local.sh 28.0.0
docker run -p 4455:4455 obswebsocket-local:latest-unsecured
```
