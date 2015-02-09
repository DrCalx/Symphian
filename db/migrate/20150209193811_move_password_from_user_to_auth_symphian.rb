class MovePasswordFromUserToAuthSymphian < ActiveRecord::Migration
  def change
    User.find_each do |u|
      if u.auth_symphian.nil?
        u.build_auth_symphian(user_id: u.id, password_digest: u.password_digest)
      end
      u.save!
    end
  end
end
