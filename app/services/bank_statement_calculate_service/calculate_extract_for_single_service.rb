# frozen_string_literal: true

module BankStatementCalculateService
  class CalculateExtractForSingleService < CalculateExtractService
    def sum_tax
      tax.calculation_forms.first.rate
    end
  end
end
