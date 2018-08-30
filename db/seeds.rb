# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(email: 'test@mail.ru', password: '123456', password_confirmation: '123456')

users = [User.create(email: 'test@mail.ru', password: '111111', password_confirmation: '111111'),
         User.create(email: 'user2@mail2.com', password: '111111', password_confirmation: '111111'),
         User.create(email: 'test2@mail.ru', password: '111111', password_confirmation: '111111', admin: true)]

organization_forms = [OrganizationForm.create(name: 'Физическое лицо (самозанятость)'),
                      OrganizationForm.create(name: 'Индивидуальный Предприниматель'),
                      OrganizationForm.create(name: 'Частное предприятие'),
                      OrganizationForm.create(name: 'OOO')]

ActivityType.create(name: 'Программирование')
ActivityType.create(name: 'Выращивание тыкв')
ActivityType.create(name: 'Страдания')
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

Organization.create(name: 'Rubizza',               organization_form: organization_forms[2])
Organization.create(name: 'Organization1',         organization_form: organization_forms[3])
Organization.create(name: 'Ivanov Ivan Ivanovich', organization_form: organization_forms[1])

Activity.create(user:          users.first,
                activity_type: ActivityType.first,
                taxation_form: TaxationForm.first,
                organization:  Organization.first)

Activity.create(user:          users.second,
                activity_type: ActivityType.second,
                taxation_form: TaxationForm.second,
                organization:  Organization.second)

Activity.create(user:          users.second,
                activity_type: ActivityType.second,
                taxation_form: TaxationForm.second,
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
