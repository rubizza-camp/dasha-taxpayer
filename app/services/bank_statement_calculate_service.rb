# frozen_string_literal: true

module BankStatementCalculateService
  def self.calculate(tax, file_with_statement)
    data_statement          = BankStatementService.new(:bgpb, :csv, file_with_statement).fetch
    parsing_data            = data_statement.parse
    handling_data_statement = data_statement.handling_data(parsing_data)
    GetTaxForOrganizationService.fetch(tax).new(handling_data_statement, tax)
  end
end
