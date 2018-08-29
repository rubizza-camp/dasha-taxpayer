# frozen_string_literal: true

module HintsHelper
  def hint_org_form(organization_form)
    organization_form.hint.translates.find_by(locales: 'ru').text
  end

  def hint_tax_form(taxation_form)
    taxation_form.hint.translates.find_by(locales: 'ru').text
  end

  def hint_tax_page(name_tax)
    TaxationForm.find_by(name: name_tax).hint.translates.find_by(locales: 'ru').text
  end
end
