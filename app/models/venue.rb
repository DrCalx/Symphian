class Venue < ActiveRecord::Base
  has_one :address, dependent: destroy
  validates :name, presence: true
end
