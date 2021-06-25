# OBS-Websocket-Docker
Docker image that runs OBS with Palakis OBS Websocket installed.

**Only obs-websocket version 5.0.0 and higher is supported.**

## Running

To start the container:
```
docker-compose up
```
OBS will run with the obs-websocket plugin installed, listening on the default port and password (see [Configuration](#Configuration))

To take down the container:
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

TODO

## Known Issues
 - obs-websocket cannot be configured with authentication disabled; this is not currently a feature in 5.x (providing a blank password does not disable authentication).
 
## TODO
 - OBS version
 - Websocket version