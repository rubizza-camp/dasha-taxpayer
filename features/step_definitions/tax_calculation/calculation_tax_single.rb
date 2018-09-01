# frozen_string_literal: true

Given(/^Register organization with form_tax Единый налог/) do
  @organization          = FactoryBot.create(:organization, :global_dominator)
  @activity              = FactoryBot.create(:activity, user: @current_user)
  @organization.activities << @activity
  @tax = FactoryBot.create(:tax, name: 'Единый налог', activity: @activity,
                                 payment_period: '01.06.2018'..'30.06.2018',
                                 declaration_period: '01.06.2018'..'30.06.2018')
end

When(/^Я перехожу на страницу taxes/) do
  visit taxes_path
end

Then(/^Я вижу налог (.*)/) do |tax|
  expect(page).to have_content tax
end

Then(/^Я вижу связанную с налогом кнопку рассчитать налог/) do
  expect(page).to have_css('.calculate')
end

When(/^Я нажал на кнопку ([a-zA-Zа-яА-Я]+) налог/) do |btn|
  visit taxes_path
  click_link btn
end

Then(/^Я перешел на страницу выбора способов рассчета/) do
  expect(page).to have_content 'Download csv file for statement'
end

Then(/^Я вижу способ "БГПБ CSV"/) do
  expect(page).to have_content 'Belgazprombank'
end

Then(/^Я выбираю файл с выпиской/) do
  attach_file(:my_file, Rails.root.join('spec', 'fixtures', 'files', 'bgpb_statement.csv'))
end

Then(/^Я нажимаю кнопку ([a-zA-Zа-яА-Я]+)/) do |button|
  click_button(button)
end

When(/^Выписка успешна загружена и обработана/) do
  expect(page).to have_content 'Statement successfully loaded and processed'
end

Then(/^Я вижу детали рассчета/) do |data|
  table_headers = ['receipts in BYN', 'Exchange difference', 'Gross revenue', 'Amount of tax payable']
  row_values = data.cell_matrix.second.first.value.split(',').map(&:strip)
  table_headers.each do |value|
    expect(page).to have_content value
  end
  row_values.each do |value|
    expect(page).to have_content value
  end
end
