# OBS-Websocket-Docker
Docker image that runs OBS with Palakis OBS Websocket installed.

## Running

To start the container:
```
docker-compose up
```

To take down the container:
```
docker-compose down

# Optionally remove built image so you can rebuild it
docker-compose down --rmi local
```

## Configuration
TODO:
 - websocket auth disable/enable
 - websocket auth password
- OBS version
 - Websocket version
 - websocket port