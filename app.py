# Reference: https://pythonbasics.org/flask-tutorial-hello-world/

from flask import Flask

app = Flask(__name__)

@app.route('/welcome')
def index():
    return 'Welcome to Udacity! Yashwini! Second test !'

app.run(host='0.0.0.0', port=80)