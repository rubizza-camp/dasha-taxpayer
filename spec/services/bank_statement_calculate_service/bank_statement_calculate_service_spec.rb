# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Style/StringLiterals
RSpec.describe BankStatementCalculateService do
  let(:tax) { OpenStruct.new(name: 'УСН') }
  let(:success_result_for_statement) do
    {receipts: 5861.1, exchange_difference: -6.47, gross_revenue: 5854.63, sum_tax: 292.73}
  end
  describe "processes an extract of Belgazprombank from csv file" do
    it "returns success calculate" do
      data_statement          = BankStatementCalculateService::BankStatementService.new(:bgpb, :csv, file_fixture("bgpb_statement.csv")).fetch
      parsing_data            = data_statement.parse
      handling_data_statement = data_statement.handling_data(parsing_data)
      row = BankStatementCalculateService::GetTaxForOrganizationService.fetch(tax).new(handling_data_statement)

      expect(row.receipts).to eq(success_result_for_statement[:receipts])
      expect(row.exchange_difference).to eq(success_result_for_statement[:exchange_difference])
      expect(row.gross_revenue).to eq(success_result_for_statement[:gross_revenue])
      expect(row.sum_tax).to eq(success_result_for_statement[:sum_tax])
    end
  end
end
# rubocop:enable Style/StringLiterals
