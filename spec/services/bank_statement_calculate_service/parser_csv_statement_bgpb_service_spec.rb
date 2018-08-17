# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Style/StringLiterals
RSpec.describe BankStatementCalculateService::ParserCsvStatementBgpbService do
  let(:csv_file) { file_fixture("bgpb_statement.csv") }
  describe "parse CSV file" do
    it "csv file success processed" do
      file = BankStatementCalculateService::ParserCsvStatementBgpbService.parse(csv_file)
      expect(file).to be_kind_of(CSV::Table)
    end
    it "first row success received" do
      csv_data = BankStatementCalculateService::ParserCsvStatementBgpbService.parse(csv_file)
      expect(csv_data.count).to eq(8)
      expect(csv_data.first["Документ - Дата"]).to match(/\d{2}\.\d{2}\.\d{4}/)
    end
  end
end
# rubocop:enable Style/StringLiterals
