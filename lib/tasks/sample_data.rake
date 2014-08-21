namespace :db do
	task populate: :environment do
		User.create!(	name: "Matthew Duguay",
									email: "matthew@duguay.com",
									password: "pass123",
									password_confirmation: "pass123")
		User.create!( name: "Steven Matiasz",
									email: "steven@matiasz.com",
									password: "pass123",
									password_confirmation: "pass123")
		Instrument.create!(	name: "Guitar",
												category: "String")
		Instrument.create!(	name: "Banjo",
												category: "String")
		Instrument.create!(	name: "Trumpet",
												category: "Brass")
		@hfz = Group.create!(	name: "HFZ")
		@hfz.
	end
end