Feature: Create organizations
  As a registered user of the website
  I want to have the ability to create organizations

  Background:
    Given test user
    Given test OrganizationForm, ActivityType, TaxationForm
    Given I login as user

  @wip
  Scenario: Create organization
    Given I click Organizations
    When I click New Organization
    And I fill organization fields
    And I add activity for organization
    And I click Create Organization
    Then I should see "Organization was successfully created"

  @wip
  Scenario: Edit Organization
    Given I have organization with activity
    When I going to edit my organization
    And I fill organization fields
    And I click Remove this activity
    And I click Add Activity
    And I add activity for organization
    And I click Update Organization
    Then I should see "Organization was successfully updated"
    And I should see new organization info
    And I should see only new activity for my organization
