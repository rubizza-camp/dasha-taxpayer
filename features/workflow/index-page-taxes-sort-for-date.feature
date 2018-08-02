Feature: Сортированный по дате список налогов подлежащих уплате организациями пользователя
  Отображение списка налогов подлежащих уплате организациями пользователя
  После логина

    Scenario: Отобразить страницу со списком налогов подлежащих уплате организациями пользователя
      Given I signed up as user
      And I see the label "Organization"
      And I see the "Taxes" button
      And I see the "Create new organization" button
      When Я имею 0 организаций
      Then Я вижу надпись "Здесь будут отображены добавленные вами организации."

      When Я имею 1 или более организаций
      Then I should see a list of my organization
      And I should see the "Edit" button to the right of each line
      And I should see the "Delete" button to the right of the "Edit" button

      When I click "Taxes" button
      Then Я перехожу на страницу с таблицей содержащей налоги подлежащие уплате организациями пользователя
      When Я имею 0 организаций
      Then Я вижу надпись "Сначала вам необходимо добавить организацию."

      When Я имею 1 или более организаций
      Then Я должен увидеть таблицу с налогами подлежащими уплате
      And Отсортированную по крайней для уплаты дате
      And I should see the "Organization" button
      And I should see the label "Taxes"
