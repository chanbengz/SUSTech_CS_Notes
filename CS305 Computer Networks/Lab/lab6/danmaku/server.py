import asyncio
import websockets


class DanmakuServer:
    def __init__(self):
        self.danmu = ''
        self.clients = []

    async def reply(self, websocket):
        self.clients.append(websocket)
        while True:
            self.danmu = await websocket.recv()
            for socket in self.clients:
                await socket.send(self.danmu)


if __name__ == "__main__":
    server = DanmakuServer()
    asyncio.get_event_loop().run_until_complete(
        websockets.serve(server.reply, 'localhost', 8765))
    asyncio.get_event_loop().run_forever()