defmodule ElixirSdetExerciseTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # var configStart = navigate_to("http://facebook.com")
  #   IO.inspect(page_title())
  #   maximize_window(current_window_handle())

  # Start hound session and destroy when tests are run
  hound_session()

  test "Facebook Sign Up Without Any Data" do
    navigate_to("http://facebook.com")
    IO.inspect(page_title())
    maximize_window(current_window_handle())
    refute page_title() == "Facebook - Log In or Sign Up"
    click({:css, "button[name='websubmit']"})
    try do
    rescue
    e in  -> take_screenshot("../../screenshots/Wrong_Email_Data.png")
    end

  end

  # test "Facebook Sign Up With Wrong Confirmation E-mail" do
  #   navigate_to("http://facebook.com")
  #   IO.inspect(page_title())
  #   maximize_window(current_window_handle())
  #   # First name
  #   fill_field({:css, "input[name='firstname']"}, "Jus")
  #   # Last name
  #   fill_field({:css, "input[name='lastname']"}, "For")
  #   # Email (Can use phone instead, accepts letters and numbers - for phone the field will auto translate letters to numerical after submission)
  #   fill_field({:css, "input[name='reg_email__']"}, "tst4ct7@gmail.com")
  #   # Confirm email
  #   fill_field({:css, "input[name='reg_email_confirmation__']"}, "tst4ct@gmail.com")
  #   # Password
  #   # invalid
  #   fill_field({:css, "input[name='reg_passwd__']"}, "Testi!")
  #   # Month
  #   input_into_field({:css, "select[id='month']"}, "Feb")
  #   # Day
  #   input_into_field({:css, "select[id='day']"}, "20")
  #   # Year
  #   input_into_field({:css, "select[id='year']"}, "2001")
  #   # Select Gender (u_0_8 - female, u_0_9 - male, u_0_a - custom)
  #   click({:css, "input[id='u_0_9']"})
  #   # Submit form
  #   click({:css, "button[name='websubmit']"})
  #   # need to modify to perform only on fail
  #   :timer.sleep(1000)
  #   refute page_title() == "Facebook - Log In or Sign Up"
  #   take_screenshot("../../screenshots/Wrong_Email_Data.png")
  # end

  # test "Tries The Wrong login" do
  # navigate_to("http://facebook.com")
  #   IO.inspect(page_title())
  #   maximize_window(current_window_handle())
  #   fill_field({:css, "input[id='email']"}, "tst4ct7@gmail.com")
  #   fill_field({:css, "input[id='pass']"}, "Testi!")
  #   click({:css, "input[value='Log In']"})
  #   :timer.sleep(50000)
  #   assert visible_text({:css, "div[role='alert']"}) == "The password you’ve entered is incorrect"
  # end

end
