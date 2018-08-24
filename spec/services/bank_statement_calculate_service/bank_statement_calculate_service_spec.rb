# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Style/StringLiterals
RSpec.describe BankStatementCalculateService do
  let(:activity) { build :activity }
  let(:tax) { TaxesBuilderPresenter.new(activity) }
  let(:taxation_form) { build :taxation_form }
  let(:success_result_for_statement) do
    {receipts: 5861.1, exchange_difference: -6.47, gross_revenue: 5854.63, sum_tax: 58_546_300.0}
  end
  describe "processes an extract of Belgazprombank from csv file" do
    it "returns success calculate" do
      data_statement          = BankStatementCalculateService::BankStatementService.new(:bgpb, :csv, file_fixture("bgpb_statement.csv")).fetch
      parsing_data            = data_statement.parse
      handling_data_statement = data_statement.handling_data(parsing_data)
      taxation_form.name = 'УСН'
      row = BankStatementCalculateService::GetTaxForOrganizationService.fetch(taxation_form).new(handling_data_statement, tax)

      expect(row.receipts).to eq(success_result_for_statement[:receipts])
      expect(row.exchange_difference).to eq(success_result_for_statement[:exchange_difference])
      expect(row.gross_revenue).to eq(success_result_for_statement[:gross_revenue])
      expect(row.sum_tax).to eq(success_result_for_statement[:sum_tax])
    end
  end
end
# rubocop:enable Style/StringLiterals
