class Account
  include Hanami::Entity
  attributes :email, :password_hash
end
