Feature: Первый Логин
  Пользователь должен определить свою деятельность
  После первого логина

    @wip
    Scenario: Определить есть ли регистрация в качестве экономического субъекта
      Given I have new user
      When I log in for the first time
      Then я вижу на странице текст "Расскажите нам больше о себе"
      And я вижу на странице текст "Вы уже зарегистрировали свою деятельность?"

    @wip
    Scenario: Я ответил, что зарегистрирован ИП
      Given I log in for the first time
      When Отвечаю на вопрос "Вы уже зарегистрировали свою деятельность?" "Да"
      Then I see selectbox "Тип" with the following fields
        | Физическое лицо (самозанятость) |
        | Индивидуальный Предприниматель  |
        | ООО                             |
        | Частное предприятие             |

      When I select "Индивидуальный Предприниматель"
      Then I see form with following fields
        | ФИО                                | textfield |
        | УНП                                | textfield |
        | ОКЭД                               | textfield |
        | Адрес                              | textfield |
        | Имя Руководителя                   | textfield |
        | Форма Налогообложения              | textfield |
        | Количество людей по договору найма | textfield |

      When I populate form with values
        | ФИО                                | textfield |
        | УНП                                | textfield |
        | ОКЭД                               | textfield |
        | Адрес                              | textfield |
        | Имя Руководителя                   | textfield |
        | Форма Налогообложения              | textfield |
        | Количество людей по договору найма | textfield |
      And submit
      Then I am redirected to dashbaoad page
      And I see flash message "Привет, друг"
