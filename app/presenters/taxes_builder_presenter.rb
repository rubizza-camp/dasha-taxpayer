# frozen_string_literal: true

class TaxesBuilderPresenter < BasePresenter
  class UnknownPeriodType < StandardError; end

  delegate :name, to: :taxation_form, prefix: :tax
  delegate :name, to: :organization, prefix: :organization
  delegate :calculation_forms, to: :taxation_form

  def rate
    calculation_forms.first.rate
  end

  def uncompleted?
    declaration_task&.uncompleted? || payment_task&.uncompleted?
  end
end
