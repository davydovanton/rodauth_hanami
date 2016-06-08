require 'roda'
require 'sequel/core'
require 'bcrypt'
require 'erubis'
require 'tilt/erubis'

class AuthApp < Roda
  DB = Sequel.connect(ENV['RODAUTH_HANAMI_DATABASE_URL'])

  plugin :render, escape: true, check_paths: true, views: 'apps/auth/templates'
  plugin :hooks
  plugin :middleware

  plugin :rodauth do
    enable :login, :logout
    # Since we are using SQLite as the database and not PostgreSQL, just store the
    # password hash in a column in the main table
    account_password_hash_column :password_hash
    login_redirect{ session[:previous_path] || '/' }
  end

  route do |r|
    env['rodauth'] = rodauth
    r.rodauth
  end
end

module Rodauth
  module Login
    def login_view
      'login template'
    end
  end

  module Logout
    def logout_view
      'logout template'
    end
  end
end
