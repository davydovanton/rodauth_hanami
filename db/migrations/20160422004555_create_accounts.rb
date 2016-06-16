Hanami::Model.migration do
  change do
    create_table :accounts do
      primary_key :id

      column :email, String, unique: true, null: false
      column :password_hash, String
    end

    # Used by the account verification and close account features
    #
    # create_table :account_statuses do
    #   primary_key :id
    #
    #   column :name, String, null: false, unique: true
    # end
    #
    # deadline_opts = proc do |days|
    #   if database_type == :mysql
    #     { null: false }
    #   else
    #     { null: false, default: Sequel.date_add(Sequel::CURRENT_TIMESTAMP, days:days) }
    #   end
    # end
    #
    # # Used by the password reset feature
    # create_table :account_password_reset_keys do
    #   foreign_key :id, :accounts, primary_key: true, type: Bignum
    #   column :key, String, null: false
    #   column :deadline, DateTime, deadline_opts[1]
    # end
    #
    # # Used by the account verification feature
    # create_table :account_verification_keys do
    #   foreign_key :id, :accounts, primary_key: true, type: Bignum
    #   column :key, String, null: false
    #   column :requested_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
    # end
    #
    # # Used by the remember me feature
    # create_table :account_remember_keys do
    #   foreign_key :id, :accounts, primary_key: true, type: Bignum
    #   column :key, String, null: false
    #   column :deadline, DateTime, deadline_opts[14]
    # end
    #
    # # Used by the lockout feature
    # create_table :account_login_failures do
    #   foreign_key :id, :accounts, primary_key: true, type: Bignum
    #   column :number, Integer, null: false, default: 1
    # end
    # create_table :account_lockouts do
    #   foreign_key :id, :accounts, primary_key: true, type: Bignum
    #   column :key, String, null: false
    #   column :deadline, DateTime, deadline_opts[1]
    # end
    #
    # # Used by the password expiration feature
    # create_table :account_password_change_times do
    #   foreign_key :id, :accounts, primary_key: true, type: Bignum
    #   column :changed_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
    # end
    #
    # # Used by the account expiration feature
    # create_table(:account_activity_times) do
    #   foreign_key :id, :accounts, primary_key: true, type: Bignum
    #   column :last_activity_at, DateTime, null: false
    #   column :last_login_at, DateTime, null: false
    #   column :expired_at, DateTime
    # end
    #
    # # Used by the single session feature
    # create_table :account_session_keys do
    #   foreign_key :id, :accounts, primary_key: true, type: Bignum
    #   column :key, String, null: false
    # end
    #
    # # Used by the otp feature
    # create_table :account_otp_keys do
    #   foreign_key :id, :accounts, primary_key: true, type: Bignum
    #   column :key, String, null: false
    #   column :num_failures, Integer, null: false, default: 0
    #   column :last_use, Time, null: false, default: Sequel::CURRENT_TIMESTAMP
    # end
    #
    # # Used by the recovery codes feature
    # create_table :account_recovery_codes do
    #   foreign_key :id, :accounts, type: Bignum
    #   column :code, String
    #   primary_key [:id, :code]
    # end
    #
    # # Used by the sms codes feature
    # create_table(:account_sms_codes) do
    #   foreign_key :id, :accounts, primary_key: true, type: Bignum
    #   column :phone_number, String, null: false
    #   column :num_failures, Integer
    #   column :code, String
    #   column :code_issued_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
    # end
    #
    #
    # create_table :account_password_hashes do
    #   foreign_key :id, :accounts, primary_key: true, type: Bignum
    #   column :password_hash, String, null: false
    # end
    #
    # # Used by the disallow_password_reuse feature
    # create_table :account_previous_password_hashes do
    #   primary_key :id, type: Bignum
    #   foreign_key :account_id, :accounts, type: Bignum
    #   column :password_hash, String, null: false
    # end
  end
end
