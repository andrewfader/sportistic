Given /^a logged in user$/ do
  user = User.create(email: "michael@phelps.com", password: "foobar", password_confirmation: "foobar")
  visit new_user_session_path
  fill_in "user_email", :with => user.email
  fill_in "user_password", :with => user.password
  click_button "Sign in"
end
