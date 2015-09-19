source 'https://rubygems.org'

ruby File.read(File.expand_path('../.ruby-version', __FILE__)).strip.sub('ruby-', '')

gem 'rails', '~> 4.2.4'
gem 'sass-rails', '~> 5.0.4'
gem 'therubyracer', '~> 0.12.2', platforms: :ruby
gem 'uglifier', '~> 2.7.2'
gem 'unicorn', '~> 4.9.0'
gem 'rails_12factor', '~> 0.0.3', group: :production
gem 'duck_puncher', '~> 2.0.0'

group :development, :test do
  gem 'better_errors', '~> 2.1.1'
  gem 'binding_of_caller', '~> 0.7.2'
  gem 'drg', '~> 0.12.0'
  gem 'byebug', '~> 6.0.2'
end

group :test do
  gem 'rspec-rails', '~> 3.3.3'
  gem 'rspec-collection_matchers', '~> 1.1.2'
  gem 'rspec-its', '~> 1.2.0'
  gem 'capybara', '~> 2.5.0'
  gem 'capybara-screenshot', '~> 1.0.11'
  gem 'capybara-webkit', '~> 1.7.0'
  gem 'headless', '~> 2.2.0'
end
