Feature: Teams

  Scenario:
    Given a logged in user
    And a league
    When I go to the teams page
    And I follow "Create Team"
    And I fill in "team_name" with "Hanshin Tigers"
    And I fill in "team[location]" with "Hokkaido"
    And I choose "Baseball" within ".team_team_sports_sport_id"
    And I choose "Beginner"
    And I select "MLB" from "League"
    And I fill in "Year founded" with "1996"
    And I press "Create Team"
    And I follow "Teams"
    Then I should see "Hanshin Tigers"

    When I follow "Hanshin Tigers" within ".datatable"
    Then I should see "Baseball"
    And I should see "Beginner"
    And I should see "MLB"
    And I should see "1996"

  Scenario: Matching teams
    Given a logged in user
    When I go to the about page
    And I follow "Profile"
    And I follow "Edit my athletic info"
