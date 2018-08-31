Feature: Assistant to create organization
  As a registered user of the website
  I want to have help for create organization

  Background:
    Given test user
    Given test data with constraints
    Given I login as user
    Given I click Organizations

  Scenario: Create organization
    When I click Assistant to create organization
    And I fill survey fields
    And I click Get organization
    Then I have activity for new organization
    And I have tasks for organization creation in tasks list

  Scenario: Organization selection error
    Given only unsuitable taxation forms
    When I click Assistant to create organization
    And I fill survey fields
    And I click Get organization
    Then I should see "Sorry you cannot open the desired organization"
