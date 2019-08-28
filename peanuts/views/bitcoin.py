from peanuts.lib import btc
from flask import Blueprint, render_template, jsonify


bp = Blueprint('bitcoin', __name__, url_prefix='/bitcoin')

@bp.route('/')
def index():
    best_block_hash = btc.rpc(
        method='getblockchaininfo',
        params=[]
    )['result']['bestblockhash'];

    info = btc.rpc(
        method='getblock',
        params=[best_block_hash]
    )['result']

    return render_template('bitcoin/index.html', info=info)
