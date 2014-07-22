require 'spec_helper'

describe User do
	
	before { @user = User.new(name:"Test User", email: "user@test.com") }

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }

	it { should be_valid }

	describe "with a blank name" do
		before { @user.name = " " }
		it { should_not be_valid }
	end

	describe "with a blank email" do
		before { @user.email = " " }
		it { should_not be_valid }
	end
end