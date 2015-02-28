class Update < ActiveRecord::Base
  belongs_to :group
  validates :group_id, presence: true
  
  belongs_to :user
  validates :user_id, presence: true
end
