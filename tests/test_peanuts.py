from flask import url_for

import pytest
from urllib.request import urlopen

import peanuts

@pytest.fixture
def app():
    return peanuts.create_app()

@pytest.mark.usefixtures('live_server')
class TestLiveServer:
    def test_rpc_connection(self):
        res = urlopen(url_for('hello', _external=True))
        assert res.code == 200
