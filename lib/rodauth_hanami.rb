require 'hanami/model'
require 'hanami/mailer'
Dir["#{ __dir__ }/rodauth_hanami/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/rodauth_hanami_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/rodauth_hanami_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/rodauth_hanami_development'
  #    adapter type: :sql, uri: 'mysql://localhost/rodauth_hanami_development'
  #
  adapter type: :sql, uri: ENV['RODAUTH_HANAMI_DATABASE_URL']

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  # mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
  mapping do
    collection :accounts do
      entity     Account
      repository AccountRepository

      attribute :id,   Integer
      attribute :email, String
      attribute :password_hash, String
    end
  end
end.load!

# Hanami::Mailer.configure do
#   root "#{ __dir__ }/rodauth_hanami/mailers"
#
#   # See http://hanamirb.org/guides/mailers/delivery
#   delivery do
#     development :test
#     test        :test
#     # production :stmp, address: ENV['SMTP_PORT'], port: 1025
#   end
# end.load!
