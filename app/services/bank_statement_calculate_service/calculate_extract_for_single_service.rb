# frozen_string_literal: true

module BankStatementCalculateService
  class CalculateExtractForSingleService < CalculateExtractService
    RATE_FIXED_TAX = 119.35
    def sum_tax
      RATE_FIXED_TAX
    end
  end
end
