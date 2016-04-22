require 'roda'
require 'sequel/core'
require 'bcrypt'
require 'erubis'
require 'tilt/erubis'

class AuthApp < Roda
  DB = Sequel.connect(ENV['RODAUTH_HANAMI_DATABASE_URL'])
  # unless db.table_exists?(:accounts)
  #   db.create_table(:accounts) do
  #     primary_key :id
  #     String :email, unique:true, null:false
  #     String :password_hash, null:false
  #   end
  #
  #   # Add a demo account for testing, since we aren't allowing users to create their own
  #   # accounts.
  #   db[accounts].insert(email:'demo', password_hash:BCrypt::Password.create('demo'))
  # end

  plugin :render, escape:true, check_paths: true, views: 'apps/auth/templates'
  plugin :hooks
  plugin :middleware

  plugin :rodauth do
    enable :login, :logout
    # Since we are using SQLite as the database and not PostgreSQL, just store the
    # password hash in a column in the main table
    account_password_hash_column :password_hash
  end

  # Alias render to erb, since the layout calls the erb method to render
  alias erb render

  route do |r|
    r.rodauth
    env['rodauth'] = rodauth
  end
end
