Feature: Сортированный по дате список налогов подлежащих уплате организациями пользователя
  Отображение списка налогов подлежащих уплате организациями пользователя
  После логина

    Scenario: Отобразить страницу со списком налогов подлежащих уплате организациями пользователя без добавленных организаций
      Given I signed up as user
      And I have 0 organizations
      And I see the link "Organization"
      And I see the link "Taxes"
      And I see the "Create new organization" button
      When I go to the taxes page
      Then Я вижу надпись "Сначала вам необходимо добавить организацию."
      And I should see the "Organization" link
      And I should see the "Taxes" link

    Scenario: Отобразить страницу со списком налогов подлежащих уплате организациями пользователя
      Given I signed up as user
      And I have 2 organizations
      And I see the link "Organization"
      And I see the link "Taxes"
      And I see the "Create new organization" button
      And today 25/06/2018
      And Крайняя дата оплаты единого налога 01/07/2018
      And Крайняя дата оплаты налога при УСН 20/07/2018
      When I go to the taxes page
      Then Я перехожу на страницу с таблицей содержащей налоги подлежащие уплате организациями пользователя
      And Я должен увидеть таблицу с налогами подлежащими уплате
      -----------------------------------------------------
      |    Date    |     Name    |         Taxes          |
      -----------------------------------------------------
      | 01/07/2018 | Ivanov I.I. | 45 BYN                 |
      -----------------------------------------------------
      | 20/07/2018 | Happy Soft  | 3% от выручки, без НДС |
      -----------------------------------------------------
      And Отсортированную по крайней для уплаты дате
      And I should see the link "Organization"
      And I should see the link "Taxes"
