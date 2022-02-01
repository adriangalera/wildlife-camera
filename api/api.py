import socketserver
from http import server
import os

INDEX_URL = "/home/pi/wild/api/index.html"


class Api(server.BaseHTTPRequestHandler):

    def __cors__(self):
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "*")
        self.send_header("Access-Control-Allow-Headers", "*")

    def do_GET(self):
        try:
            f = open(INDEX_URL, 'rb')
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(f.read())
            f.close()
            return
        except IOError:
            self.send_error(404, 'File Not Found: %s' % self.path)

    def do_POST(self):
        if self.path == "/reboot":
            os.system("sudo reboot")
            self.send_response(200)
            self.__cors__()
            self.end_headers()
        elif self.path == "/standalone":
            os.system("sudo rfkill block all")
            self.send_response(200)
            self.__cors__()
            self.end_headers()
        else:
            self.send_error(404)
            self.end_headers()

    def do_OPTIONS(self):
        self.send_response(200)
        self.__cors__()
        self.end_headers()


class StreamingServer(socketserver.ThreadingMixIn, server.HTTPServer):
    allow_reuse_address = True
    daemon_threads = True


if __name__ == "__main__":
    address = ("", 80)
    try:
        server = StreamingServer(address, Api)
        server.serve_forever()
    except Exception as e:
        print(e)
