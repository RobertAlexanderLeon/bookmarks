ENV["RACK_ENV"] = 'test' 

require 'database_cleaner'
require 'capybara/rspec'

require_relative '../app/server'

Capybara.app = Sinatra::Application.new

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
  
end