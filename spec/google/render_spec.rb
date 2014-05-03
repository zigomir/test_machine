require 'spec_helper'

describe 'google.com', :type => :feature do
  before :each do
    setup_capybara
    Capybara.app_host = 'http://www.google.com'
  end

  it 'google screenshot' do
    visit '/'
    page.driver.render 'screenshots/google.png'
  end

  it 'check google content' do
    visit '/'
    expect(page).to have_content 'Slovenija'
  end

end
