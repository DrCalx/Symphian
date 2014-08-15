require 'spec_helper'

describe "User pages" do
	subject {page}

	describe "signup page" do
		before { visit signup_path }

		it { should have_content('Sign up') }
	end

	describe "profile" do
		let(:user){ FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_content(user.name) }
		it { should have_title(user.name) }
	end

	describe "edit" do
		let(:user){ FactoryGirl.create(:user) }
		before { visit user_path(user) }

		describe "bio" do
			before do
				click_button "edit_bio"
				fill_in "Bio", with: "New Biography"
				click_button "Save Changes"
			end

			specify { expect(user.reload.bio).to eq "New Biography" }
		end
	end
end