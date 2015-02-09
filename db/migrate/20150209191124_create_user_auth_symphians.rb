class CreateUserAuthSymphians < ActiveRecord::Migration
  def change
    create_table :user_auth_symphians do |t|
      t.references :user, index: true
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
