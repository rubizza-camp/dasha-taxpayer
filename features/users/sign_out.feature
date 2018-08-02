Feature: Sign out
  To protect my account from unauthorized access
  A signed in user
  Should be able to sign out

    Scenario: User signs out
      Given a user exists with email: "test@mail.ru", password: "123456", password_confirmation: "123456"
      Then I sign in
      When I sign out
      Then I should see a signed out message
      When I return to the site
      Then I should not see link logout out