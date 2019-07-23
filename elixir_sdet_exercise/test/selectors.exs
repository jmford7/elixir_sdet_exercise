# First Name (More than 1 char)
({:css, "input[name='firstname']"}, "U#1two")
# Valid - Jus
# Invalid - U#1two

# Last Name (More than 1 char)
({:css, "input[name='lastname']"}, "U#1two")
# Valid - For
# Invalid - U#1two

# Mobile / Email
({:css, "input[name='reg_email__']"}, "tst4ct7@gmail.com")
# Valid - tst4ct7@gmail.com
# Invalid - U#1twogmail.com

# Email conf
({:css, "input[name='reg_email_confirmation__']"}, "tst4ct7@gmail.com")
# Valid - tst4ct7@gmail.com
# Invalid - U#1twogmail.com

# Password (At least 6 char)
({:css, "input[name='reg_passwd__']"}, "Testing")
# Valid - Testi!
# Invalid - 1!cC

# Birthday Month
# Try valid day July 22, 2000 / try invalid day Feb 30, 2000

({:css, "select[id='month']"}, "Feb")

# Birthday Day
({:css, "select[id='month']"}, "30")

# Birthday Year
({:css, "select[id='year']"}, "1995")

# Gender Female (radial)
({:css, "input[id='u_0_8']"})

# Gender Male (radial)
({:css, "input[id='u_0_9']"})

# Gender Custom (radial)
({:css, "input[id='u_0_a']"})

# Preferred Pronoun (custom only - He, She, They)
({:css, "select[name='preferred_pronoun']"}, "They")

# Custom Gender (Optional)
({:css, "input[name='custom_gender']"}, "Testing")

# Signup (button)
({:css, "button[name='websubmit']"})
