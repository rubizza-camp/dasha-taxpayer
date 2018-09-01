Feature: Рассчет налога УСН

  Background:
    Given test user
    Given I login as user
    Given Register organization with form_tax УСН

  Scenario: Переход на страницу taxes
    When Я перехожу на страницу taxes
    Then Я вижу налог УСН
    And Я вижу связанную с налогом кнопку рассчитать налог

  Scenario: Upload CSV
    When Я нажал на кнопку Calculate налог
    Then Я перешел на страницу выбора способов рассчета
    And Я вижу способ "БГПБ CSV"
    And Я выбираю файл с выпиской
    And Я нажимаю кнопку Загрузить
    When Выписка успешна загружена и обработана
    Then Я вижу детали рассчета
      |Выручка в BYN, Курсовая разница, Валовая выручка, Сумма налога к оплате |
      |5861.1,        -6.47,            5854.63,         292.73                |