# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [User.create(email: 'test@mail.ru', password: '111111', password_confirmation: '111111'),
         User.create(email: 'user2@mail2.com', password: '111111', password_confirmation: '111111')]

organization_forms = [OrganizationForm.create(name: 'Физическое лицо (самозанятость)'),
                      OrganizationForm.create(name: 'Индивидуальный Предприниматель'),
                      OrganizationForm.create(name: 'Унитарное предприятие'),
                      OrganizationForm.create(name: 'OOO')]

ActivityType.create(name: 'Программирование')
ActivityType.create(name: 'Выращивание тыкв')
ActivityType.create(name: 'Консультирование')
ActivityType.create(name: 'Просмотр смешных видосиков')
ActivityType.create(name: 'Торговля бонстиками')

RecurrencePeriods::Monthly.create(day_start: 1, day_end: 31)
RecurrencePeriods::Monthly.create(day_start: 1, day_end: 31)
RecurrencePeriods::Quarterly.create(day_start: 15, day_end: 20)
RecurrencePeriods::Quarterly.create(day_start: 1, day_end: 22)

TaxationForm.create(name:               'Единый налог',
                    organization_form:  OrganizationForm.first,
                    declaration_period: RecurrencePeriods::Monthly.first,
                    payment_period:     RecurrencePeriods::Monthly.second)

TaxationForm.create(name:               'УСН',
                    organization_form:  OrganizationForm.second,
                    declaration_period: RecurrencePeriods::Quarterly.first,
                    payment_period:     RecurrencePeriods::Quarterly.second)

Organization.create(name: 'Rubizza',               organization_form: organization_forms[3])
Organization.create(name: 'Organization1',         organization_form: organization_forms[3])
Organization.create(name: 'Ivanov Ivan Ivanovich', organization_form: organization_forms[1])

Activity.create(user:          users.first,
                activity_type: ActivityType.find(3),
                taxation_form: TaxationForm.second,
                organization:  Organization.first)

Activity.create(user:          users.second,
                activity_type: ActivityType.find(3),
                taxation_form: TaxationForm.second,
                organization:  Organization.second)

Activity.create(user:          users.second,
                activity_type: ActivityType.find(5),
                taxation_form: TaxationForm.first,
                organization:  Organization.third)

Taxes::CalculationForms::FixedRate.create(rate: 109.22, taxation_form_id: 1, activity_type_id: 1)
Taxes::CalculationForms::FixedRate.create(rate: 155.00, taxation_form_id: 1, activity_type_id: 1)
Taxes::CalculationForms::FixedRate.create(rate: 193.67, taxation_form_id: 1, activity_type_id: 1)
Taxes::CalculationForms::PercentFromReceipt.create(rate: 5.0, taxation_form_id: 2, activity_type_id: 2)
Taxes::CalculationForms::PercentFromReceipt.create(rate: 3.0, taxation_form_id: 2, activity_type_id: 3)
Taxes::CalculationForms::PercentFromSales.create(rate: 20.0, taxation_form_id: 2, activity_type_id: 4)

Constraints::Profit.create(value: 165_000, taxation_form: TaxationForm.second)
Constraints::WorkAbroad.create(value: true, taxation_form: TaxationForm.second)
Constraints::WorkersNumber.create(value: 100, taxation_form: TaxationForm.second)
Constraints::WorkersNumber.create(value: 4, organization_form: OrganizationForm.second)

Tax.create(name: 'УСН', activity: Activity.first, payment_period: '01.06.2018'..'30.06.2018', declaration_period: '01.06.2018'..'30.06.2018')
Tax.create(name: 'УСН', activity: Activity.second, payment_period: '01.06.2018'..'30.06.2018', declaration_period: '01.06.2018'..'30.06.2018')

# Individual (self-employment)
Hint.create(hint_owner_id: OrganizationForm.find(1).id, hint_owner_type: 'OrganizationForm')
# Individual entrepreneur
Hint.create(hint_owner_id: OrganizationForm.find(2).id, hint_owner_type: 'OrganizationForm')
# Unitary Enterprise
Hint.create(hint_owner_id: OrganizationForm.find(3).id, hint_owner_type: 'OrganizationForm')
# 'LLC'
Hint.create(hint_owner_id: OrganizationForm.find(4).id, hint_owner_type: 'OrganizationForm')
# Single tax
Hint.create(hint_owner_id: TaxationForm.find(1).id, hint_owner_type: 'TaxationForm')
# Simplified system of taxation
Hint.create(hint_owner_id: TaxationForm.find(2).id, hint_owner_type: 'TaxationForm')

Translate.create(text:    'Самозанятость - это форма получения физическим лицом прибыли (дохода) путем занятия предусмотренными законодательством (ст. 1 ГК РБ, п. 1.1. Указа Президента РБ №337 от 19.09.2017г.) видами деятельности без регистрации в качестве индивидуального предпринимателя.',
                 locales: 'ru',
                 hint_id: 1)
Translate.create(text:    "Индивидуальный предприниматель – это физическое лицо, зарегистрированное в установленном законодательстве порядке в качестве индивидуального предпринимателя, самостоятельно занимающееся предпринимательской деятельностью.\n\n(Гражданский кодекс Республики Беларусь, ст. 1, 22)",
                 locales: 'ru',
                 hint_id: 2)
Translate.create(text:    "Унитарным предприятием признается коммерческая организация, учредителем (собственником имущества) которой выступают государство, юридическое или физическое лицо, не наделенная правом собственности на закрепленное за ней собственником имущество. Имущество унитарного предприятия является неделимым и не может быть распределено по вкладам (долям, паям), в том числе между работниками предприятия.\n\n(Гражданский кодекс Республики Беларусь, § 4.)",
                 locales: 'ru',
                 hint_id: 3)
Translate.create(text:    "Обществом с ограниченной ответственностью признается общество, уставный фонд которого разделен на доли определенных уставом размеров. Участники общества с ограниченной ответственностью не отвечают по его обязательствам и несут риск убытков, связанных с деятельностью общества, в пределах стоимости внесенных ими вкладов.\n\n(Гражданский кодекс Республики Беларусь, §2 п.4)",
                 locales: 'ru',
                 hint_id: 4)
Translate.create(text:    "Единый налог – это подлежащая уплате индивидуальным предпринимателем или самозанятым лицом фиксированная сумма, устанавливаемая в рамках законодательства облисполкомами или Мингорисполкомом, зависящая от: вида деятельности, региона и других условий деятельности обусловленных законадательством.\n\n(Налоговый кодекс Республики Беларусь. Особенная часть, Глава 34)",
                 locales: 'ru',
                 hint_id: 5)
Translate.create(text:    "Упрощенная система налогообложения (УСН) – это особый налоговый режим, отличающийся сравнительной простотой расчета сумм налогов,который может применяться в отношении юридических лиц и индивидуальных предпринимателей при одновременном соблюдении следующих условий: средняя численность работников организации составляет не более 100 человек; размер валовой выручки нарастающим итогом не превышает установленную законодательством сумму.\n\n(Налоговый кодекс Республики Беларусь. Особенная часть, Глава 35)",
                 locales: 'ru',
                 hint_id: 6)
