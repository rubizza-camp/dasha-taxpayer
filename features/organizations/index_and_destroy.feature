Feature: List of User organizations
  As a registered user of the website
  I want to see my organizations

  Background:
    Given test user
    Given I login as user

  Scenario: Displaying a page without organizations
    When I click Organizations
    Then I should see "Here you will see the organizations you added"
     And I should see "New Organization"

  Scenario: Displaying a page with my organizations
    Given I have organization with activity
    When I click Organizations
    Then I should see info about my organization and activity
    Then I should see organization control buttons
    When I click Destroy
    Then I should see "Organization was successfully destroyed"
    And I should see "Here you will see the organizations you added"
