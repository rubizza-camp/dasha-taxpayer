# frozen_string_literal: true

class TaxesBuilderPresenter < BasePresenter
  class UnknownPeriodType < StandardError; end

  delegate :name, to: :taxation_form, prefix: :tax
  delegate :name, to: :model, prefix: :organization
  delegate :declaration_period, to: :taxation_form
  delegate :payment_period, to: :taxation_form
  delegate :calculation_forms, to: :taxation_form

  def next_declaration_period
    declaration_period.next_period
  end

  def next_payment_period
    payment_period.next_period
  end

  def rate
    calculation_forms.first.rate
  end
end
