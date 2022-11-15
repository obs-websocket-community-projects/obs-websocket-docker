#!/bin/sh

# Install Python dependencies
echo "Installing Python dependencies"
python -m pip install --upgrade pip
pip install websocket-client

# Run the image
echo "Running the image"
docker run -d -p 4455:4455 --name $2 $1:$2

# Wait a few seconds
echo "Waiting for startup to complete"
sleep 5

# Verify the conn, but suppress stderr so we can collect logs
echo "Attempting to connect"
python ./verify_conn.py $3 suppress_std_err

# Collect the logs
CONTAINER_ID=$(docker ps --filter="ancestor=$1" --latest --format="{{.ID}}")
echo "Collecting Logs for container ID ${CONTAINER_ID}"
docker logs -n all ${CONTAINER_ID}

# Run again; if it failed, then it will stderr and fail the build here
python ./verify_conn.py $3

docker rm --force $2