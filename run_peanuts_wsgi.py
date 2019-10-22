from waitress import serve;
import peanuts
from config2.config import config

app = peanuts.create_app()

listen = "*:%s"%(config['port'])

serve(app, listen=listen)
