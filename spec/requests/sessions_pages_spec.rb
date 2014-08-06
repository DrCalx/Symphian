require 'spec_helper'

describe 'Session' do
	subject { page }

	describe "signin page" do
		before { visit signin_path }

		it { should have_content('Sign in') }
		it { should have_title('Sign in') }
	end

	describe "with valid info" do
		let(:user) { FactoryGirl.create(:user) }
		before { sign_in(user) }

		it { should have_link('Profile', href: user_path(user)) }
		it { should have_link('Settings', href: settings_path) }
		it { should have_link('Sign Out', href: signout_path) }
		it { should_not have_link('Sign in', href: signin_path) }
	end
end