require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ]

  def sign_in_as(user)
    visit new_session_url
    fill_in "Enter your email address", with: user.email_address
    fill_in "Enter your password", with: "password"
    click_on "Sign in"
  end
end
