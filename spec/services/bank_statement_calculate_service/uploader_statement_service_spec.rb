# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Style/StringLiterals
RSpec.describe BankStatementCalculateService::UploaderStatementService do
  let(:csv_file) { file_fixture("bgpb_statement.csv") }

  describe "access to reading the CSV file" do
    it "csv file success reading" do
      file = BankStatementCalculateService::UploaderStatementService.upload(csv_file)
      expect(file).to be_truthy
    end
  end
end
# rubocop:enable Style/StringLiterals
