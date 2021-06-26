# pip install websocket-client
import sys
import websocket

nostderr = len(sys.argv) >= 2 and sys.argv[1] == "suppress_std_err"
print("Suppressing stderr: " + str(nostderr))

try:
    ws = websocket.WebSocket()
    ws.connect("ws://localhost:4444", timeout=3)
    print(ws.recv())
    ws.close(timeout=3)
except Exception as exception:
    if(nostderr):
        print(exception)
    else:
        raise exception