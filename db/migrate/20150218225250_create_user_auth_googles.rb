class CreateUserAuthGoogles < ActiveRecord::Migration
  def change
    create_table :user_auth_googles do |t|
      t.references :user, index: true
      t.string :token
      t.string :refresh_token
      t.datetime :expires_at
      t.boolean :expires

      t.timestamps null: false
    end
  end
end
