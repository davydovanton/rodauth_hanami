require './config/environment'
require './apps/auth/auth_app'

use Rack::Session::Cookie, secret: ENV['WEB_SESSIONS_SECRET']
use Rack::Csrf
use AuthApp

run Hanami::Container.new
