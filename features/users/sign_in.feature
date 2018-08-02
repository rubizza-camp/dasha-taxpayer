Feature: Sign in
  In order to get access to protected sections of the site
  A user should be able to sign in

  Background:
    Given I go to the home page

    Scenario: User is not signed up
      When I click Login
      And I sign in with unregistered email
      Then I see an invalid email or password message

    Scenario: User signs in successfully
      Given a user exists with email: "test@mail.ru", password: "password"
      When I click Login
      Then I see form for login
      When I sign in with valid credentials
      Then I see a successful sign in message
      