ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
gem 'minitest'
require 'minitest/autorun'
require 'action_controller/test_case'
require 'rails/test_help'
require 'miniskirt'
require 'factories'

# Support files                                                                                                                                                                                                                                                                  
Dir["#{File.expand_path(File.dirname(__FILE__))}/support/*.rb"].each do |file|
  require file
end
