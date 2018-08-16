# frozen_string_literal: true

module BankStatementCalculateService
  class GetTaxForOrganizationService
    def self.fetch(organization_id)
      @organization = Organization.find(organization_id)
      case @organization.taxation_form.name
      when 'УСН'
        CalculateExtractForUsnService
      when 'Единый налог'
        CalculateExtractForSingleService
      end
    end
  end
end
