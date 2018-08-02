Feature: Sign up
  In order to get access to protected sections of the site
  As a user
  I want to be able to sign up

    Background:
      Given I go to the home page
        And I click Signup

    Scenario: User signs up with valid data
      When I sign up with email and password
      Then I should see a successful sign up message
      
    Scenario: User signs up with invalid email
      Given a user exists with email: "test@mail.ru", password: "password", password_confirmation: "password"
      When I sign up with email and password
      Then I should see an invalid email message

    Scenario: User signs up without password
      When I sign up without a password
      Then I should see a missing password message

    Scenario: User signs up with short password
      When I sign up without short password
      Then I should see password length message

    Scenario: User signs up without password confirmation
      When I sign up without a confirm password
      Then I should see a missing password confirmation message

    Scenario: User signs up with mismatched password and confirmation
      When I sign up with a mismatched password confirmation
      Then I should see a mismatched password message
