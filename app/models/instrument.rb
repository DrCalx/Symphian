class Instrument < ActiveRecord::Base
	has_many :user_played_instruments
	has_many :users, through: :user_played_instruments
end
