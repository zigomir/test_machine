require 'pry'
require 'capybara/rspec'
require 'capybara/poltergeist'

# Use binding.pry wherever you want to stop execution and debug your tests

def setup_capybara
  Capybara.run_server        = false
  Capybara.current_driver    = :poltergeist
  Capybara.javascript_driver = :poltergeist

  # ignore js errors - TODO fix!
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, {js_errors: false})
  end
end
