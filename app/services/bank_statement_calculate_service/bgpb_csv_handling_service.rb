# frozen_string_literal: true

module BankStatementCalculateService
  class BgpbCsvHandlingService
    def self.fetch(csv)
      data_csv = csv.map do |row|
        document_data = row['Документ - Дата']
        binding.pry
        next if document_data.blank?
        statement_data = OpenStruct.new
        statement_data.document_data = document_data
        statement_data.nominal_debit = row['Номинал - Дебет'].to_f
        statement_data.equivalent_debit = row['Эквивалент - Дебет'].to_f
        statement_data.correspondent_currency = row['Корреспондент - Валюта']
        statement_data.equivalent_debit_byn_nbrb = CurrencyCalculatorService.rate_byn(statement_data.document_data,
                                                                                      statement_data.nominal_debit, statement_data.correspondent_currency)
        statement_data
      end
      data_csv.reject(&:blank?)
    end
  end
end
