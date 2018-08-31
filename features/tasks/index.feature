Feature: List of User tasks
  As a registered user of the website
  I want to see my tasks

  Background:
    Given test user
    Given I login as user
    Given I have payment task

  Scenario: Completed task
    When I click Tasks
    Then I should see info about my task
    When I completed task
    Then I have completed payment task
    And I should see "First you need to add an organization"

  Scenario: Canceled task
    When I click Tasks
    Then I should see info about my task
    When I canceled task
    Then I have failed payment task
    And I should see "First you need to add an organization"
