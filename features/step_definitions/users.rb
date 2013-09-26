Given /^a logged in user$/ do
  user = FactoryGirl.create(:user)
  visit new_user_session_path
  fill_in "user_email", :with => user.email
  fill_in "user_password", :with => user.password
  click_button "Sign in"
end

When /^I wait for the request to finish$/ do
  start_time = Time.now
  page.evaluate_script('jQuery.isReady&&jQuery.active==0').class.should_not eql(String) until page.evaluate_script('jQuery.isReady&&jQuery.active==0') or (start_time + 5.seconds) < Time.now do
    sleep 1
  end
end

Given /^a league$/ do
  League.create(name: 'MLB', url: 'http://www.mlb.com/')
end
