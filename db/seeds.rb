# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(email: 'test@mail.ru', password: '123456', password_confirmation: '123456')

users = [User.create(email: 'yourname@yourcompany.com', password: '111111', password_confirmation: '111111'),
         User.create(email: 'user2@mail2.com', password: '111111', password_confirmation: '111111')]

organization_forms = [OrganizationForm.create(name: 'Физическое лицо (самозанятость)'),
                      OrganizationForm.create(name: 'Индивидуальный Предприниматель'),
                      OrganizationForm.create(name: 'Частное предприятие'),
                      OrganizationForm.create(name: 'OOO')]

ActivityType.create(name: 'Деятельность1')
ActivityType.create(name: 'Деятельность2')
ActivityType.create(name: 'Деятельность3')
ActivityType.create(name: 'Деятельность4')
ActivityType.create(name: 'Деятельность5')

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

Organization.create(name: 'Rubizza',               user: users.first, organization_form: organization_forms[2], taxation_form_id: 2)
Organization.create(name: 'Organization1',         user: users.last,  organization_form: organization_forms[3], taxation_form_id: 2)
Organization.create(name: 'Ivanov Ivan Ivanovich', user: users.last,  organization_form: organization_forms[1], taxation_form_id: 1)

Taxes::CalculationForms::FixedRate.create(rate: 109.22, taxation_form_id: 1, activity_type_id: 1)
Taxes::CalculationForms::FixedRate.create(rate: 155.00, taxation_form_id: 1, activity_type_id: 1)
Taxes::CalculationForms::FixedRate.create(rate: 193.67, taxation_form_id: 1, activity_type_id: 1)
Taxes::CalculationForms::PercentFromReceipt.create(rate: 5.0, taxation_form_id: 2, activity_type_id: 2)
Taxes::CalculationForms::PercentFromReceipt.create(rate: 3.0, taxation_form_id: 2, activity_type_id: 3)
Taxes::CalculationForms::PercentFromSales.create(rate: 20.0, taxation_form_id: 2, activity_type_id: 4)
