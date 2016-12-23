require 'rubygems'
require 'capybara/rspec'
require 'capybara/webkit'
require 'headless'

Capybara.default_wait_time = 5
Capybara.javascript_driver = :webkit

ENV["RAILS_ENV"] = 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  ::Capybara::Webkit.configure do |c|
    c.block_unknown_urls
  end
  config.include Capybara::DSL
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.expect_with(:rspec) { |c| c.syntax = :should }
end
