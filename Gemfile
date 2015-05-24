source 'https://rubygems.org'

ruby File.read('.ruby-version').strip

gem 'rails', '4.2.0'
gem 'therubyracer', '~> 0.12', platforms: :ruby
gem 'uglifier', '~> 2.7'
gem 'unicorn', '~> 4.9'
gem 'rails_12factor', group: :production
gem 'duck_puncher'

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'byebug'
  gem 'rspec-rails'
  gem 'rspec-collection_matchers'
  gem 'rspec-its'
  gem 'capybara', '~> 2.4'
  gem 'capybara-screenshot', '~> 1.0'
  gem 'capybara-webkit', '~> 1.5'
  gem 'headless', '~> 2.1'
end