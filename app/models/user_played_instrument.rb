class UserPlayedInstrument < ActiveRecord::Base
	belongs_to :user
	belongs_to :instrument
end
