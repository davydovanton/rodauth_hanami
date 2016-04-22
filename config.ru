require './config/environment'
require './lib/rodauth_app'

use Rack::Session::Cookie, secret: ENV['WEB_SESSIONS_SECRET']
use Rack::Csrf
use RodauthApp

run Hanami::Container.new
