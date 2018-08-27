# frozen_string_literal: true

Given(/^Register organization with form_tax УСН/) do
  @organization            = FactoryBot.create(:organization, :alexeyka)
  @activity                = FactoryBot.create(:activity, :sale_of_kittens, user: @current_user)
  @organization.activities << @activity
  @tax = FactoryBot.create(:tax, :tax_usn, name: 'УСН', activity: @activity,
                                           payment_period: '01.06.2018'..'30.06.2018',
                                           declaration_period: '01.06.2018'..'30.06.2018')
end
