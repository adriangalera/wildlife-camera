from flask import Flask
from flask import render_template
import radiokiller

app = Flask(__name__)


@app.route("/")
def index():
    return render_template('index.html')


@app.route("/kill/radio", methods=['POST'])
def kill_radio():
    radiokiller.kill_radio()
    return ""


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
