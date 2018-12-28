import os
from flask import Blueprint, render_template, jsonify
from bitcoinrpc.authproxy import AuthServiceProxy, JSONRPCException

bp = Blueprint('bitcoin', __name__, url_prefix='/bitcoin')

@bp.route('/')
def index():
    rpc_connection = AuthServiceProxy(
        "http://%s:%s@127.0.0.1:8332"%(os.environ['RPC_USER'], os.environ['RPC_PASSWORD'])
    )
    best_block_hash = rpc_connection.getbestblockhash()
    info = rpc_connection.getblock(best_block_hash)
    return render_template('bitcoin/index.html', info=info)
