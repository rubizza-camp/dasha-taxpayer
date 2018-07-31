Feature: Home Page
  A user that is not signed it
  Should be able see home page

    Scenario: Singin and Login links
      Given I have no user
      When I open home page
      Then I can see Singin and Login links

    Scenario: Moto
      Given I have no user
      When I open home page
      Then I can see text "Налоги - это весело"
