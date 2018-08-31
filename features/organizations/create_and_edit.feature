Feature: Create organizations
  As a registered user of the website
  I want to have the ability to create organizations

  Background:
    Given test user
    Given test OrganizationForm, ActivityType, TaxationForm
    Given I login as user

  @javascript
  Scenario: Create organization
    Given I click Organizations
    When I click New Organization
    And I fill organization fields
    And I click Add activity
    And I add first activity for organization
    And I click Create Organization
    Then I should see "Organization was successfully created"

  @javascript
  Scenario: Edit Organization
    Given I have organization with activity
    When I going to edit my organization
    And I click Remove this activity
    And I click Add activity
    And I add second activity for organization
    And I fill organization fields
    And I click Update Organization
    Then I should see "Organization was successfully updated"
    And I should behold new organization info
    And I should behold only new activity for my organization
