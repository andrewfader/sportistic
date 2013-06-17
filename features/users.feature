Feature: User signup, login, and profile

  Scenario:
    When I go to the home page
    And I follow "Join"
    And I fill in "Email" with "michael@phelps.com"
    And I fill in "user_password" with "foobar"
    And I fill in "Password confirmation" with "foobar"
    And I press "Sign up"
    Then I should see "Welcome! You have signed up successfully."

    When I follow "Profile"
    And I follow "Edit"
    And I fill in "Name" with "Michael Phelps"
    And I fill in "Sports" with "Swimming, bong rips"
    And I fill in "Location" with "USA"
    And I fill in "Current password" with "foobar"
    And I press "Update"
    And I follow "Profile"
    Then I should see "Michael Phelps"
    And I should see "Swimming, bong rips"
    And I should see "USA"


    When I follow "Log out"
    Then I should see "Signed out successfully."



