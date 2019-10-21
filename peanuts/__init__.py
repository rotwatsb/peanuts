import os, requests
from flask import Flask, render_template
from myce import api_client

def create_app():
    # create and configure the app
    # __name__ is the name of the current Python module
    # instance_relative_config tells the app that configuration files are relative to the
    # instance folder
    app = Flask(__name__, instance_relative_config=True)

    # SECRET_KEY is used to securely sign session cookies
    app.config.from_mapping(
        SECRET_KEY='dev'
    )

    app.config.from_json('config/default.json')
    app.config.from_json('config/' + app.config['ENV'] + '.json')

    # a simple page that says hello
    @app.route('/hello')
    def hello():
        return 'Hello, World!'

    client = api_client.create()

    # a temporary endpoint to test the microservices architecture
    @app.route('/bitcoin')
    def bitcoin():
        info = client.blockchain.get_info().json()

        return render_template('bitcoin/index.html', info=info)

    # a temporary endpoint to test the microservices architecture
    @app.route('/bitcoin/best-block')
    def bestblock():
        info = client.block.get_best_block().json()

        return render_template('bitcoin/index.html', info=info)

    return app
