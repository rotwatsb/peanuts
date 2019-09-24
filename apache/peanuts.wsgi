import logging, sys, os

logging.basicConfig(stream=sys.stderr)
os.environ["RPC_BITCOIN_HOST"] = "localhost"
os.environ["RPC_USER"] = "localdev"
os.environ["RPC_PASSWORD"] = "localdev"

from peanuts import create_app
application = create_app()
