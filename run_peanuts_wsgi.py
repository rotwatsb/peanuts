from waitress import serve;
import peanuts

app = peanuts.create_app()

serve(app, listen='*:5000')
