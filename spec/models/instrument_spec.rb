require 'spec_helper'

describe Instrument do
	before { @instrument = FactoryGirl.create(:instrument) }
  it { should respond_to(:users) }
end
