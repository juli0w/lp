ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each do |f|
  require f
end

RSpec.configure do |config|
  config.before(:suite) do
    Product.delete_all
    User.delete_all
  end

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.include AuthMacros
  config.include Default

  # config.fixture_path = "#{::Rails.root}/spec/fixtures"
end