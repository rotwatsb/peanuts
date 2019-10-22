import os, requests
from flask import Flask, render_template
from config2.config import config # must import config before myce.api_client
from myce import api_client

def create_app():
    # create and configure the app
    # __name__ is the name of the current Python module
    app = Flask(__name__)

    # SECRET_KEY is used to securely sign session cookies
    app.config.from_mapping(
        SECRET_KEY='dev'
    )

    # a simple page that says hello
    @app.route('/hello')
    def hello():
        return 'Hello, World!'

    client = api_client.create()

    @app.route('/blockchain')
    def get_blockchain_info():
        info = client.blockchain.get_info().json()

        return render_template('bitcoin/index.html', info=info)

    @app.route('/block')
    def get_best_block():
        info = client.block.get_best_block().json()

        return render_template('bitcoin/index.html', info=info)

    return app
