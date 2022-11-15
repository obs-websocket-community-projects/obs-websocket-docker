# pip install websocket-client
import sys
import websocket

unsecured = len(sys.argv) >= 2 and sys.argv[1] == "unsecured"
nostderr = len(sys.argv) >= 3 and sys.argv[2] == "suppress_std_err"
print("Suppressing stderr: " + str(nostderr))

try:
    ws = websocket.WebSocket()
    ws.connect("ws://localhost:4455", timeout=3)
    message = ws.recv()
    print(message)
    if (unsecured):
        if ("authentication" in message):
            raise Exception('The connection is secured while in unsecured mode')
    else:
        if ("authentication" not in message):
            raise Exception('The connection is unsecured while in secured mode')

    ws.close(timeout=3)
except Exception as exception:
    if (nostderr):
        print(exception)
    else:
        raise exception
