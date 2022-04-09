require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  Capybara.register_driver :selenium_chrome_headless_nosandbox do | app |
    options = Selenium::WebDriver::Chrome::Options.new;
    options.add_argument('--headless');
    options.add_argument('--no-sandbox');
    driver = Capybara::Selenium::Driver.new(app, browser: :chrome, options: options);
  end

  driven_by :selenium_chrome_headless_nosandbox
end
