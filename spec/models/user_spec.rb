require 'spec_helper'

describe User do
	
	before { @user = User.new(name:"Test User", email: "user@test.com",
														password: "pass123", password_confirmation: "pass123") }

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:authenticate) }

	it { should be_valid }

	describe "with a blank name" do
		before { @user.name = " " }
		it { should_not be_valid }
	end

	describe "with a blank email" do
		before { @user.email = " " }
		it { should_not be_valid }
	end

	describe "with a name that is too long" do
		before { @user.name = 'a'*51 }
		it { should_not be_valid }
	end

	describe "with an email that is already used" do
		before do
			dup_user = @user.dup
			dup_user.save
		end

		it { should_not be_valid }
	end

	describe "with a blank password" do
		before do 
			@user.password = " "
			@user.password_confirmation = " "
		end

		it { should_not be_valid }
	end

	describe "with a password that's too short" do
		before { @user.password = @user.password_confirmation = "a"*5 }
		it { should_not be_valid }
	end

	describe "when authenticating" do
		before { @user.save }
		let(:found_user) { User.find_by(email: @user.email) }

		describe "with valid password" do
			it { should eq found_user.authenticate(@user.password) }
		end

		describe "with invalid password" do
			let(:user_with_invalid_password) { found_user.authenticate("fakePassword") }
			it { should_not eq user_with_invalid_password }
			specify { expect(user_with_invalid_password).to be_false }
		end
	end
end