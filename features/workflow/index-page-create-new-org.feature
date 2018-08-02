Feature: Новая организация
  Добавление пользователем новой организации
  После логина

    Scenario: Добавление пользователем новой организации
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

      When I click "Create new organization" button
      Then Я перехожу на страницу создания новой организации
      And I should see selectbox "Type" with the following fields
        | Физическое лицо (самозанятость) |
        | Индивидуальный Предприниматель  |
        | Частное предприятие             |
        | OOO                             |

      When I select "Физическое лицо (самозанятость)"
      Then Я должен увидеть поля которые зависят от выбора пользователя "Физическое лицо (самозанятость)"
        | ФИО   |
        | ОКЭД  |
        | Адрес |
      And Я должен увидеть кнопка "Далее"

      When I select "Индивидуальный Предприниматель"
      Then Я должен увидеть поля которые зависят от выбора пользователя "Индивидуальный Предприниматель"
        | ФИО                           |
        | УНП                           |
        | ОКЭД                          |
        | Адрес                         |
        | Форма Налогообложения         |
        | Имя Руководителя              |
        | Количество наемных работников |
      And Я должен увидеть кнопка "Далее"

      When I select "Частное предприятие"
      Then Я должен увидеть поля которые зависят от выбора пользователя "Частное предприятие"
        | Найменование                  |
        | УНП                           |
        | Имя Директора                 |
        | Адрес                         |
        | Форма Налогообложения         |
        | Количество наемных работников |
      And Я должен увидеть кнопка "Далее"
