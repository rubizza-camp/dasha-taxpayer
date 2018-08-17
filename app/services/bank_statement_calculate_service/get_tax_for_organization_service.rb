# frozen_string_literal: true

module BankStatementCalculateService
  class GetTaxForOrganizationService
    def self.fetch(tax)
      case tax.name
      when 'УСН'
        CalculateExtractForUsnService
      when 'Единый налог'
        CalculateExtractForSingleService
      end
    end
  end
end
