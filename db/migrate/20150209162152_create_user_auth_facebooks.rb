class CreateUserAuthFacebooks < ActiveRecord::Migration
  def change
    create_table :user_auth_facebooks do |t|
      t.references :user, index: true
      t.string :uid
      t.string :provider
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps null: false
    end
  end
end
