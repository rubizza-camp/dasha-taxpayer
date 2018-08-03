Feature: Home Page
  A user that is not signed it
  Should be able see home page

    @wip
    Scenario: Singin and Login links
      Given I have no user
      When I go to the home page
      Then I can see Singin and Login links

    @wip
    Scenario: Moto
      Given I have no user
      When I go to the home page
      Then I can see text "Налоги - это весело"
