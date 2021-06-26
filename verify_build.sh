#! /bin/bash

# Install Python dependencies
echo "Installing Python dependencies"
python -m pip install --upgrade pip
pip install websocket-client

# Run the image
echo "Running the image"
docker run -d -p 4444:4444 $1:latest

# Verify the conn, but suppress stderr so we can collect logs
echo "Attempting connect:"
python ./verify_conn.py suppress_std_err

# Collect the logs
echo "Collected Logs:"
docker logs $(docker ps --filter="ancestor=tinatiel/obswebsocket" --latest --format="{{.ID}}")

# Run again; if it failed, then it will stderr and fail the build here
python ./verify_conn.py