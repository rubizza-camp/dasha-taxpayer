# frozen_string_literal: true

module BankStatementCalculateService
  class CalculateExtractForUsnService < CalculateExtractService
    def sum_tax
      rate_usn = (tax.calculation_forms.first.rate.to_f / 100).round(2)
      (gross_revenue * rate_usn).round(2)
    end
  end
end
