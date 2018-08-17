# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Style/StringLiterals
RSpec.describe BankStatementCalculateService::BankStatementService do
  let(:csv_file) { file_fixture("bgpb_statement.csv") }
  describe "getting the right object service for Belgazprombank" do
    it "service BankStatementBgpbService success received" do
      bank = BankStatementCalculateService::BankStatementService.new(:bgpb, :csv, file_fixture("bgpb_statement.csv")).fetch
      expect(bank).to be_kind_of(BankStatementCalculateService::BankStatementBgpbService)
    end
  end
end
# rubocop:enable Style/StringLiterals
