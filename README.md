![Latest/Nightly](https://github.com/TinaTiel/obs-websocket-docker/actions/workflows/docker-latest.yml/badge.svg)

# OBS-Websocket-Docker
Docker image that runs OBS with Palakis OBS Websocket installed.

**Only obs-websocket version 5.0.0 and higher is supported.**
**This uses the ubuntu / amd64 distribution**

You can use this in GitHub Actions or your local PC, but it may not work on your Raspberry Pi.

## Running

To start the container with generic docker:
```
docker run -p 4444:4444 tinatiel/obswebsocket:latest
```

A compose file is also available in this repository as an example:
```
docker-compose up
```
The compose-file will run the latest image of `tinatiel/obswebsocket:latest`, with the default build args and environment variables (see [Configuration](#Configuration)).

To take down the docker-compose container:
```
docker-compose down

# Optionally remove built image so you can rebuild it
docker-compose down --rmi local
```

## Configuration

### Environment Variables

| Env Variable | Description                                        | Default  |
|--------------|----------------------------------------------------|----------|
| OBS_PORT     | Port where obs-websocket listens for connections.* | 4444     |
| OBS_PASS     | Password for authenticating against obs-websocket  | password |

\*Remember to expose the port too, e.g. `docker run -e OBS_PORT=4545 -p 4545:4545 ...`

### Build Arguments

| Build Argument     | Description                                  | Default  |
|--------------------|----------------------------------------------|----------|
| OBS_STUDIO_VERSION | Version of OBS Studio*                       | 27.0.1   |

\* You can search available versions in Ubuntu via `apt list -a obs-studio`

## Known Issues
 - obs-websocket cannot be configured with authentication disabled; this is not currently a feature in 5.x (providing a blank password does not disable authentication).
 
## Building
### Automated Builds
CI/CD Runs daily, at midnight.
Tag format is `tinatiel/obswebsocket:$timestamp.$obs-websocket-sha`.

### Manual Builds
If building manually (not via CI/CD), you need to create a `downloads` folder and place the unzipped
obs-websocket Ubuntu64 artifact folder in it. For example, you would have a structure like this:
```
-- Dockerfile
-- README.md
-- downloads
   \-- 5cf2b50-Ubuntu64
       \-- obs-websocket_1-5cf2b50-git-1_amd64.deb
-- .gitignore
```
Then, you can build and run as normal:
```
docker build -t obswebsocket-local .
docker run -p 4444:4444 obswebsocket-local
```