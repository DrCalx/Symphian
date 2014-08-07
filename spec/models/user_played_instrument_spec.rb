require 'spec_helper'

describe UserPlayedInstrument do
  let(:instrument) { FactoryGirl.create(:instrument) }
  let(:user) { FactoryGirl.create(:user) }
  let(:upl) { user.user_played_instruments.build(instrument_id: instrument.id) }

  subject { upl }

  it { should be_valid }
end
