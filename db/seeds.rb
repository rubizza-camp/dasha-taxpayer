# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'test@mail.ru', password: '123456', password_confirmation: '123456')

OrganizationForm.create(name: 'Физическое лицо (самозанятость)')
OrganizationForm.create(name: 'Индивидуальный Предприниматель')
OrganizationForm.create(name: 'Частное предприятие')
OrganizationForm.create(name: 'OOO')

TaxationForm.create(name: 'Единый налог', organization_form: OrganizationForm.first)
TaxationForm.create(name: 'УСН', organization_form: OrganizationForm.second)

Organization.create(name: 'Название Организации',
                    user: User.first,
                    organization_form: OrganizationForm.first,
                    taxation_form: TaxationForm.first)
