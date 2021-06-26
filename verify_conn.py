# pip install websocket-client
import websocket

ws = websocket.WebSocket()
ws.connect("ws://localhost:4444", timeout=3)
print(ws.recv())
ws.close(timeout=3)