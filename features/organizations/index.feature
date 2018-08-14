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

  Scenario: Отобразить страницу списка моих организаций
    Given I have organization
    When I click Organizations
    Then I should see info about my organization
    Then I should see organization control buttons
