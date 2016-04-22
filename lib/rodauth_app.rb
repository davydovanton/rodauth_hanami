require 'roda'
require 'sequel/core'
require 'bcrypt'
require 'erubis'
require 'tilt/erubis'

class RodauthApp < Roda
  # # Setup the database unless it already exists
  # db = Sequel.sqlite('users.sqlite3')
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

  plugin :render, escape:true, check_paths: true, views: 'apps/web/templates/auth'
  plugin :hooks
  plugin :middleware

  plugin :rodauth do
    enable :login

    # Since we are using SQLite as the database and not PostgreSQL, just store the
    # password hash in a column in the main table
    account_password_hash_column :password_hash
  end

  # Alias render to erb, since the layout calls the erb method to render
  alias erb render

  route do |r|
    r.rodauth

    # Force all users to login before accessing Ginatra
    rodauth.require_authentication
  end
end
