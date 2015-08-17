source 'https://rubygems.org'

ruby File.read(File.expand_path('../.ruby-version', __FILE__)).strip.sub('ruby-', '')

gem 'rails', '~> 4.2'
gem 'sass-rails', '~> 5.0'
gem 'therubyracer', '~> 0.12', platforms: :ruby
gem 'uglifier', '~> 2.7'
gem 'unicorn', '~> 4.9'
gem 'rails_12factor', '0.0.3', group: :production
gem 'duck_puncher', '~> 0.2'

group :development, :test do
  gem 'better_errors', '~> 2.1'
  gem 'binding_of_caller', '~> 0.7'
  gem 'drg'
end

group :test do
  gem 'byebug', '~> 5.0'
  gem 'rspec-rails', '~> 3.3'
  gem 'rspec-collection_matchers', '~> 1.1'
  gem 'rspec-its', '~> 1.2'
  gem 'capybara', '~> 2.4'
  gem 'capybara-screenshot', '~> 1.0'
  gem 'capybara-webkit', '~> 1.6'
  gem 'headless', '~> 2.2'
end
