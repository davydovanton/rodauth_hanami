require 'roda'
require 'sequel/core'
require 'bcrypt'
require 'erubis'
require 'tilt/erubis'
require_relative 'views/login/index'
require_relative 'views/logout/index'

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
      ::Auth::Views::Login::Index.new(template_object('login'), rodauth: self).render
    end

  private

    def template_object(action)
      path = ::Hanami::View.configuration.root.join("apps/auth/templates/#{action}/index.html.erb")
      ::Hanami::View::Template.new(path)
    end
  end

  module Logout
    def logout_view
      ::Auth::Views::Logout::Index.new(template_object('logout'), rodauth: self).render
    end

  private

    def template_object(action)
      path = ::Hanami::View.configuration.root.join("apps/auth/templates/#{action}/index.html.erb")
      ::Hanami::View::Template.new(path)
    end
  end
end
