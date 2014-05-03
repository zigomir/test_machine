# Capybara, rspec and poltergeist

- [capybara](https://github.com/jnicklas/capybara): Acceptance test framework for web applications
- [poltergeist](https://github.com/jonleighton/poltergeist): A PhantomJS driver for Capybara (enables also javascript testing)

## Why this setup?

- easy to integrate with CI. `PhantomJS` runs well as command line program.
- easy to write tests. `CSS` like selectors for querying DOM elements and checking for values

## Running

`rspec spec/`
or
`rspec spec/directory_you_want_to_test`


## Screenshots

```ruby
page.driver.render 'screenshots/fuji-checkout.png'
```

## Debugging

Just put `binding.pry` wherever inside your test. When execution stops at your break point you can inspect values just by typing variable names and pressing enter. To exit break point just write `exit` and execution will continue.

### Exceptional behavior

When testing javascript heavy (or weird implemented - PSD2HTML) pages you sometimes need to wait for a javascript event to complete. This will help you out:

```
page.document.should have_selector('div.chk-checked')
```

Browser will wait until it has an element with that selector.

### Quick helpers

```ruby
visit '/path/on/your/host'
click_button 'Buy'
click_link 'Home'
find('.bg-wrapper-inner h3').should have_content('Content')
current_url.should == "#{Capybara.app_host}/checkout"
page.has_selector? '#xxx'

within('div.login') do
  fill_in '_username', :with => 'example@example.com'
  fill_in '_password', :with => 'password'
  click_button 'Login'
end
```
