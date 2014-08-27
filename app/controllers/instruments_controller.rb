class InstrumentsController < ApplicationController
	def selector
		@instruments = Instrument.all
	end

	def index
		@instruments = Instrument.all
	end
end