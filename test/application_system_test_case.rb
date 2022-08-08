require "test_helper"

# 'capybara' and 'capybara/cuprite' need to be defined for EvilSystems to work properly.
require 'capybara'
# require 'capybara/cuprite'
require 'evil_systems'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: ENV.fetch("BROWSER", :headless_chrome).to_sym, screen_size: [1400, 1400]

  include EvilSystems::Helpers
end
