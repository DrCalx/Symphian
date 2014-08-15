class InstrumentsController < ApplicationController
	def selector
		@instruments = Instrument.all
	end
end