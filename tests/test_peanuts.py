import pytest

import peanuts

@pytest.fixture
def client():
    app = peanuts.create_app();
    app.testing = True
    return app.test_client();

def test_rpc_connection(client):
    rv = client.get('/bitcoin')
    assert rv.status_code == 200
