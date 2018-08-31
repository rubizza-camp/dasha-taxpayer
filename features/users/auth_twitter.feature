Feature: Sign in oauth twitter
  In order to get access to protected sections of the site
  A user should be able to sign in through account twitter

  Background:
    Given I go to the home page
    
    @omniauth_test
    Scenario: User signs in successfully
      When I click Login
      Then I see form for login
      When I Sign in with Twitter
      Then I see Signed in successfully through the twitter
