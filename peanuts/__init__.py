import os, requests
from flask import Flask, render_template

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

    # a temporary endpoint to test the microservices architecture
    @app.route('/bitcoin')
    def bitcoin():
        info = requests.get(
            "http://%s:%s/bitcoin" %(
                app.config['BTCWRAPP']['DOMAIN'],
                app.config['BTCWRAPP']['PORT']
            )
        )

        return render_template('bitcoin/index.html', info=info)

    # a temporary endpoint to test the microservices architecture
    @app.route('/bitcoin/best-block')
    def bestblock():
        info = requests.get(
            "http://%s:%s/bitcoin/best-block" %(
                app.config['BTCWRAPP']['DOMAIN'],
                app.config['BTCWRAPP']['PORT']
            )
        )

        return render_template('bitcoin/index.html', info=info)

    return app
