source 'https://rubygems.org'

ruby '1.9.3'
#when it comes time to upgrade to ruby 2.0, use pik to switch back and forth
#at this time, it seems that other gems may not play along nicely on Windows
#ruby '2.0.0'

gem 'rails', 	'4.0.8'
gem 'pg', 		'0.15.1'
gem 'webrick', '1.3.1'

gem 'bootstrap-sass', '~> 3.1.0'
gem 'sass-rails', 		'~> 4.0.0'
gem 'sprockets', '2.11.0'

gem 'bcrypt-ruby', '3.1.2'

gem 'soundcloud', '0.3.2'

#gem 'feedjira', '~> 1.0'

gem 'rails_config'

group :development, :test do
	gem 'spork-rails', '4.0.0'
	gem 'guard-spork', '1.5.0'
	gem 'childprocess', '0.3.6'
end

group :development do
	gem 'rspec-rails', 	'2.13.1'
	gem 'faker', '1.4.3'
	gem 'pry'
	gem 'pry-debugger'
end

group :test do
	gem 'selenium-webdriver', '2.35.1'
	gem 'capybara', '2.1.0'
	gem 'factory_girl_rails', '4.2.0'
end

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
	gem 'rails_12factor', '0.0.2'
end