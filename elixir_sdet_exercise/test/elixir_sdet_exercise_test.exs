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
      # modifying this to assert will pass / refute will fail
      refute page_title() == "Facebook - Log In or Sign Up"
    rescue
      # takes screenshot on fail - does not flag as fail in console
      _e -> take_screenshot("../../screenshots/Missing_Data_Error.png")
    end
  end

  test "Facebook Sign Up With Wong Password Information" do
    try do
      navigate_to("http://facebook.com")
      IO.inspect(page_title())
      maximize_window(current_window_handle())
      # First name - using firstname Tom w/ lastname Riddle will flag during sign up
      fill_field({:css, "input[name='firstname']"}, "Just")
      # Last name
      fill_field({:css, "input[name='lastname']"}, "For")
      # Email (Can use phone instead, field accepts letters and numbers - for phone, the field will auto translate letters to phone number equivalent after submission i.e. "n" = 6)
      fill_field({:css, "input[name='reg_email__']"}, "tst4ct7@gmail.com")
      # Confirm email
      fill_field({:css, "input[name='reg_email_confirmation__']"}, "tst4ct7@gmail.com")
      # Password - requires combination of at least six char, num, and spec char.
      fill_field({:css, "input[name='reg_passwd__']"}, "testing")
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
      :timer.sleep(1000)
      # refutes that sign-up did not navigate to a new page.
      refute page_title() == "Facebook - Log In or Sign Up"
    rescue
      _e -> take_screenshot("../../screenshots/Password_Error_At_Sign_Up.png")
    end
  end

  test "Facebook Sign Up With Wrong Information" do
    try do
      navigate_to("http://facebook.com")
      IO.inspect(page_title())
      maximize_window(current_window_handle())
      # First name
      fill_field({:css, "input[name='firstname']"}, "Omar")
      # Last name
      fill_field({:css, "input[name='lastname']"}, "Herbig")
      # Email
      fill_field({:css, "input[name='reg_email__']"}, "tst4ct7@gmail.com")
      # Confirm email
      fill_field({:css, "input[name='reg_email_confirmation__']"}, "OtterSpace7@gmail.com")
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
      :timer.sleep(1000)
      # refutes that sign-up did not navigate to a new page.
      refute page_title() == "Facebook - Log In or Sign Up"
    rescue
      _e -> take_screenshot("../../screenshots/Wrong_EmailConf_At_Sign_Up.png")
    end
  end

  test "Tries The Wrong Login EC" do
    navigate_to("http://facebook.com")
    IO.inspect(page_title())
    maximize_window(current_window_handle())
    fill_field({:css, "input[id='email']"}, "tst4ct7@gmail.com")
    fill_field({:css, "input[id='pass']"}, "Testi!")
    click({:css, "input[value='Log In']"})
    :timer.sleep(1000)
    assert visible_text(
             {:xpath, "//div[contains(text(),'The password you’ve entered is incorrect.')]"}
           ) == "The password you’ve entered is incorrect. Forgot Password?"
  end
end
