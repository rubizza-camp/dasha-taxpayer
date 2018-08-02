Feature: List of User organizations
  Отображение списка организаций пользователя
  После логина

    Scenario: Отобразить страницу с организациями пользователя
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

      When I click "Edit" button
      Then Я перехожу на страницу с информацией об организации в строке которой нажата кнопка "Edit"
      And Я могу редактировать поля организации в зависимости от "Type" организации
        | ФИО                           |
        | Найменование                  |
        | УНП                           |
        | Адрес                         |
        | Имя Директора                 |
        | ОКЭД                          |
        | Форма Налогообложения         |
        | Количество наемных работников |

      When I click "Delete" button
      Then Я удаляю организацию в строке которой нажата кнопка "Edit"
