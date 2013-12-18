#Be careful, the interpeter reads this like pure ruby

# General

# Requests that we want locked though our CDN 
#PUBLIC_URL    = 'gatekeeper.freetable.info'

# Requests outside of our load balancing ( Round robin against the public nodes )
#PUBLIC_URL_RR = 'gatekeepers.freetable.info'

PUBLIC_URL = 'sinatra.freetable.info'
PUBLIC_URL_RR = 'sinatra.freetable.info'

# Database Socket
HOST_POOL = 'localhost'
DB_USER   = 'ft-net-srv'
DB_PASS   = '7f2eb44a0f8a1763ad9c3e15dd947bfc4dc04bdd'  # This is for example purposes only!
DB_NAME   = 'Freetable'

# User Recovery
MANDRILL_APIKEY = 'jjlJTedHlDk7GytbUmvKOQ'

