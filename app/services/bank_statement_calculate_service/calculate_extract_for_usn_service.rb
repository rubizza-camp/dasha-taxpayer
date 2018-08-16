# frozen_string_literal: true

module BankStatementCalculateService
  class CalculateExtractForUsnService < CalculateExtractService
    RATE_USN = 0.05
    def sum_tax
      (gross_revenue * RATE_USN).round(2)
    end
  end
end
