# frozen_string_literal: true

module BankStatementCalculateService
  def self.calculate(activities, file_with_statement)
    taxation_form           = activities.first.taxation_form
    handling_data_statement = handling_data_for_statement(file_with_statement)
    data_calculate = GetTaxForOrganizationService.fetch(taxation_form).new(handling_data_statement)
    create_tax(taxation_form, data_calculate)
    data_calculate
  end

  def self.create_tax(taxation_form, data_calculate)
    taxation_form.activities.each do |activity|
      activity.taxes.first.update(receipts:            data_calculate.receipts,
                                  exchange_difference: data_calculate.exchange_difference,
                                  gross_revenue:       data_calculate.gross_revenue,
                                  sum_tax:             data_calculate.sum_tax)
    end
  end

  def self.handling_data_for_statement(file_with_statement)
    data_statement          = BankStatementService.new(:bgpb, :csv, file_with_statement).fetch
    parsing_data            = data_statement.parse
    data_statement.handling_data(parsing_data)
  end
end
