Feature: Teams

  Scenario:
    Given a logged in user
    When I go to the home page
    And I follow "Create Team"
    And I fill in "Name" with "Hanshin Tigers"
    And I fill in "Location" with "Hokkaido"
    And I fill in "Sport" with "Baseball"
    And I press "Create Team"
    And I follow "Teams"
    Then I should see "Hanshin Tigers"
