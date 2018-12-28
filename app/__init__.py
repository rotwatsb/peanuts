import os
from app.views import bitcoin

from flask import Flask

def create_app():
    # create and configure the app
    # __name__ is the name of the current Python module
    # instance_relative_config tells the app that configuration files are relative to the
    # instance folder
    app = Flask(__name__)

    # SECRET_KEY is used to securely sign session cookies
    app.config.from_mapping(
        SECRET_KEY='dev'
    )

    app.config.from_json('config/default.json')
    app.config.from_json('config/' + app.config['ENV'] + '.json')

    app.register_blueprint(bitcoin.bp)

    # a simple page that says hello
    @app.route('/hello')
    def hello():
        return 'Hello, World!'

    return app
