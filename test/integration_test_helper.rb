require "test_helper"
require "capybara/rails"
require 'capybara-screenshot'
require "rack_session_access/capybara"
 
module ActionController
  class IntegrationTest
    include Capybara::DSL
  end
end