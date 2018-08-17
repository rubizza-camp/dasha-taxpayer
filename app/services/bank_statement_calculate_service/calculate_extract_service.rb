# frozen_string_literal: true

module BankStatementCalculateService
  class CalculateExtractService
    attr_reader :objects_statement_data
    def initialize(objects_statement_data)
      @objects_statement_data = objects_statement_data
    end

    def receipts
      objects_statement_data.sum(&:equivalent_debit_byn_nbrb).round(2)
    end

    def receipts_equivalent
      objects_statement_data.sum(&:equivalent_debit).round(2)
    end

    def exchange_difference
      (receipts_equivalent - receipts).round(2)
    end

    def gross_revenue
      (receipts + exchange_difference).round(2)
    end

    def sum_tax; end
  end
end
