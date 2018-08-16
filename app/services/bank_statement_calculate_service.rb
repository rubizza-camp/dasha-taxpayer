# frozen_string_literal: true

module BankStatementCalculateService
  def self.calculate(params)
    bank_statement          = BankStatementService.new(:bgpb).fetch
    data_statement          = bank_statement.new(:csv, params[:my_file])
    parsing_data            = data_statement.parse
    handling_data_statement = data_statement.handling_data(parsing_data)
    GetTaxForOrganizationService.fetch(params[:id]).new(handling_data_statement)
  end
end
