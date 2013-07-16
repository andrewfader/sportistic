Feature: User signup, login, and profile

  Scenario: Signup, edit profile, and logout
    When I go to the home page
    And I follow "Join"
    And I fill in "Email" with "michael@phelps.com"
    And I fill in "user_password" with "foobar"
    And I fill in "Password confirmation" with "foobar"
    And I fill in "Name" with "Michael Phelps"
    And I fill in "City" with "NYC"
    And I fill in "State" with "Wisconsin"
    And I choose "Male"
    And I check "Basketball"
    And I press "Sign up"
    Then I should see "Welcome! You have signed up successfully."

    When I choose "Awesome"
    And I check "Forward"
    And I press "Update"
    And I follow "Profile"
    Then I should see "Michael Phelps"
    And I should see "NYC"
    And I should see "Wisconsin"
    And I should see "Basketball"
    And I should see "Awesome"
    And I should see "Forward"

    When I follow "Log out"
    Then I should see "Signed out successfully."

  Scenario: Login
    Given a logged in user
    When I go to the home page
    Then I should not see "Join"
    And I should not see "Log in"
    But I should see "Log out"
