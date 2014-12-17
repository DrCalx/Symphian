class Venue < ActiveRecord::Base
  has_one :address
  validates :name, presence: true
end
