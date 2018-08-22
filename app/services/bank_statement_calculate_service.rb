# frozen_string_literal: true

module BankStatementCalculateService
  def self.calculate(taxation_form, file_with_statement)
    parsing_data            = BankStatementService.new(:bgpb, :csv, file_with_statement).fetch.parse
    handling_data_statement = data_statement.handling_data(parsing_data)
    data_calculate = GetTaxForOrganizationService.fetch(taxation_form).new(handling_data_statement)
    create_tax(taxation_form, data_calculate)
    data_calculate
  end

  def self.create_tax(taxation_form, data_calculate)
    taxation_form.activities.each do |activity|
      declaration_period = taxation_form.declaration_period
      payment_period     = taxation_form.payment_period
      Tax.create name: taxation_form.name, activity: activity,
                 receipts: data_calculate.receipts,
                 exchange_difference: data_calculate.exchange_difference,
                 gross_revenue: data_calculate.gross_revenue,
                 sum_tax: data_calculate.sum_tax,
                 payment_period: DateHandlingHelper.dates_for_two_days(payment_period.day_start, payment_period.day_end),
                 declaration_period: DateHandlingHelper.dates_for_two_days(declaration_period.day_start, declaration_period.day_end)
    end
  end
end
