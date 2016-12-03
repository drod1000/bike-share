ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'
require 'database_cleaner'
<<<<<<< HEAD
require 'pry'
=======
>>>>>>> f72ee22499f51f637c3ebae555402604b565de7f

Capybara.app = BikeShareApp
DatabaseCleaner.strategy = :truncation

DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.before(:all) do
    DatabaseCleaner.clean
  end
<<<<<<< HEAD
  c.after(:each) do
    DatabaseCleaner.clean
  end
=======

  c.after(:each) do
    DatabaseCleaner.clean
  end

>>>>>>> f72ee22499f51f637c3ebae555402604b565de7f
  c.include Capybara::DSL

  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
end
