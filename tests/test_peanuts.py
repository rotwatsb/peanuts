from flask import url_for

import pytest
import urllib2

import peanuts

@pytest.fixture
def app():
    return peanuts.create_app()

@pytest.mark.usefixtures('live_server')
class TestLiveServer:
    def test_rpc_connection(self):
        res = urllib2.urlopen(url_for('bitcoin.index', _external=True))
        assert res.code == 200
        assert ('merkleroot' in res.read()) == True
