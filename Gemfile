source 'https://rubygems.org'

ruby '1.9.3'
#when it comes time to upgrade to ruby 2.0, use pik to switch back and forth
#at this time, it seems that other gems may not play along nicely on Windows
#ruby '2.0.0'

gem 'rails', '4.0.8'

# Use sqlite3 as the database for Active Record
group :development do
	gem 'sqlite3', 			'1.3.8'
	gem 'rspec-rails', 	'2.13.1'
end

group :test do
	gem 'selenium-webdriver', '2.35.1'
	gem 'capybara', '2.1.0'
end

gem 'sass-rails', 		'4.0.1'
gem 'uglifier', 			'2.1.1'
gem 'coffee-rails', 	'4.0.1'
gem 'jquery-rails', 	'3.0.4'
gem 'turbolinks', 		'1.1.1'
gem 'jbuilder', 			'1.0.2'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

#The plan is to deploy to heroku, and use their free PostgreSQL backend
group :production do
	gem 'pg', 						'0.15.1'
	gem 'rails_12factor', '0.0.2'
end