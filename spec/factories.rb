FactoryGirl.define do
	factory :user do
		name			"Matt Duguay"
		email			"matt@duguay.com"
		password	"pass123"
		password_confirmation 	"pass123"
	end
end