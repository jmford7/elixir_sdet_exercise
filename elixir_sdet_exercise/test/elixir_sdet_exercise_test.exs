defmodule ElixirSdetExerciseTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()

  test "goes to facebook" do
    navigate_to "http://facebook.com"
    IO.inspect page_title()
    assert page_title() == "Facebook - Log In or Sign Up"
    fill_field({:css, "input[name='firstname']"}, "Trial")

    # click({:css, 'input[name="firstname"]'})
    # send_text("Trial")
    # take_screenshot("C:/Users/jmfor/Desktop/Divvy_Challenge/screenshots")
  end
  # test "verify facebook open" do

  # end
end
