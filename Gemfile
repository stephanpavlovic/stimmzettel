source 'https://rubygems.org'

ruby '1.9.3'

gem 'airbrake'
gem 'compass-rails', github: 'milgner/compass-rails', branch: 'rails4'
gem 'jquery-rails'
gem 'pg'
gem 'rails', '>= 4.0'
gem 'quiet_assets'
gem 'newrelic_rpm'


group :assets do
  gem 'coffee-rails'
  gem 'sass-rails'
  gem 'haml-rails'
  gem 'uglifier'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'smurfville'
  gem 'i18n_viz'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara-webkit', '>= 0.14.1'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'timecop'
end

group :deploy do
  gem "capistrano"
  gem "capistrano-ext"
end
