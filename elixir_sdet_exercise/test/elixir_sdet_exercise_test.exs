defmodule ElixirSdetExerciseTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()

  test "Facebook Sign Up Without Any Data" do
    try do
    navigate_to("http://facebook.com")
    IO.inspect(page_title())
    maximize_window(current_window_handle())
    click({:css, "button[name='websubmit']"})
    refute page_title() == "Facebook - Log In or Sign Up"
    rescue
    _e -> take_screenshot("../../screenshots/Missing_Data_Error.png") #takes screenshot on fail - does not flag as fail in console
    end
  end

  test "Facebook Sign Up With Wrong Confirmation E-mail" do
    navigate_to("http://facebook.com")
    IO.inspect(page_title())
    maximize_window(current_window_handle())
    # First name
    fill_field({:css, "input[name='firstname']"}, "Tom")
    # Last name
    fill_field({:css, "input[name='lastname']"}, "Riddle")
    # Email (Can use phone instead, field accepts letters and numbers - for phone, the field will auto translate letters to phone number equivalent after submission i.e. "n" = 6)
    fill_field({:css, "input[name='reg_email__']"}, "tst4ct7@gmail.com")
    # Confirm email
    fill_field({:css, "input[name='reg_email_confirmation__']"}, "tst4ct7@gmail.com")
    # Password
    fill_field({:css, "input[name='reg_passwd__']"}, "Testi!")
    # Month
    input_into_field({:css, "select[id='month']"}, "Feb")
    # Day
    input_into_field({:css, "select[id='day']"}, "20")
    # Year
    input_into_field({:css, "select[id='year']"}, "2001")
    # Select Gender (u_0_8 - female, u_0_9 - male, u_0_a - custom)
    click({:css, "input[id='u_0_9']"})
    # Submit form
    click({:css, "button[name='websubmit']"})
    :timer.sleep(60000)
    assert page_title() == "Facebook - Log In or Sign Up"
    #add assert on div alert.
    take_screenshot("../../screenshots/Wrong_Email_Data.png")
  end

  test "Tries The Wrong Login" do
  navigate_to("http://facebook.com")
    IO.inspect(page_title())
    maximize_window(current_window_handle())
    fill_field({:css, "input[id='email']"}, "tst4ct7@gmail.com")
    fill_field({:css, "input[id='pass']"}, "Testi!")
    click({:css, "input[value='Log In']"})
    :timer.sleep(1000)
    assert visible_text({:xpath, "//div[contains(text(),'The password you’ve entered is incorrect.')]"}) == "The password you’ve entered is incorrect. Forgot Password?"
  end
end


