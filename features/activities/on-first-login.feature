@wip
Feature: On First Login
  On first login user should be asked about his activities

    Scenario: I sign in and edit my name
      Given I have created user
      And have now activities
      When I login for the first time
      Then I am asked about my activities

    Scenario: I am asked about my activity in questionnaire
      Given I am existing user
      When I login for the first time
      Then I see selectbox with list of activities
              | Программист    |
              | Фермер         |
              | Путешественник |

    Scenario: Next question in questionnaire after I selected activity
      Given I am asked about my activity in questionnaire
      When I select "Программист"
      Then I see activities

