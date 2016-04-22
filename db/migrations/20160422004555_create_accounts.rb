Hanami::Model.migration do
  change do
    create_table :accounts do
      primary_key :id

      column :email, String, unique: true, null: false
      column :password_hash, String
    end
  end
end
