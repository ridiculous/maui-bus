source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails',     :git => 'git://github.com/rails/rails.git', :branch => '3-2-stable'
gem 'journey',   :git => 'git://github.com/rails/journey.git', :branch => '1-0-stable'
gem 'arel',      :git => 'git://github.com/rails/arel.git', :branch => '3-0-stable'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', :git => 'git://github.com/rails/coffee-rails.git', :branch => '3-2-stable'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'rails-dev-boost'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'debugger'
end

group :test do
  gem 'rspec-rails'
end

gem 'jquery-rails'

gem 'thin'
gem 'therubyracer'
gem 'less-rails' # Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem 'twitter-bootstrap-rails'
gem 'newrelic_rpm'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# To use debugger
# gem 'debugger'
