class MovePasswordFromUserToAuthSymphian < ActiveRecord::Migration
  def change
    User.find_each do |u|
      u.auth_symphian.find_or_initialize_by_user_id(user_id: u.id, password_digest: u.password_digest)
      u.save!
    end
  end
end
