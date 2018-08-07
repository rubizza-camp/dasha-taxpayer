Feature: Первый Логин
  Пользователь должен определить свою деятельность
  После первого логина

    Scenario: Определить есть ли регистрация в качестве экономического субъекта
      Given I have new user
      When I log in for the first time
      Then я вижу на странице текст "Расскажите нам больше о себе"
      And я вижу на странице текст "Вы уже зарегистрировали свою деятельность?"

    Scenario: Я ответил "Нет, хочу зарегистрироваться".
      Given I log in for the first time
      When Отвечаю на вопрос "Вы уже зарегистрировали свою деятельность?" "Нет"
      Then I am redirected to questions page

    Scenario: Конкретизировать и формализовать бизнес-идею.
      Given Я нахжусь на странице вопросов #(наш тест блок)
      And Я вижу вопрос "Чем вы хотите заниматься?"
      And I see selectbox "Деятельность" with the following fields
        | Программировать         |
        | Обучать                 |
        | Замниматься фермерством |
        | Консультировать         |
        | Торговать               |
        | фыр фыр фыр :)          |

      When I select "Программировать"
      Then I see form with following fields
        | Свой продукт | textfield |
        | По контракту | textfield |

      When I select "Свой продукт"
      Then I see form with following fields
        | Командой       | textfield |
        | Одному         | textfield |

      When I populate form with values
        | С резидентами РБ         | textfield |
        | С зарубежными партнерами | textfield |
      And submit
      Then I am redirected to activity page
      And I see message "Вот что у нас получается"
