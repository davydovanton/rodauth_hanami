require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/rodauth_hanami'
require_relative '../apps/admin/application'
require_relative '../apps/web/application'

Hanami.configure do
  mount Admin::Application, at: '/admin'
  mount Web::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/rodauth_hanami_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/rodauth_hanami_development'
    #    adapter :sql, 'mysql://localhost/rodauth_hanami_development'
    #
    adapter :sql, ENV['DATABASE_URL']

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/rodauth_hanami/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery :test
  end

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json

    mailer do
      delivery :smtp, address: ENV['SMTP_HOST'], port: ENV['SMTP_PORT']
    end
  end
end
