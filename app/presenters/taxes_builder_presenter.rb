# frozen_string_literal: true

class TaxesBuilderPresenter < BasePresenter
  class UnknownPeriodType < StandardError; end

  delegate :name, to: :taxation_form, prefix: :tax
  delegate :name, to: :organization, prefix: :organization
  delegate :declaration_period, to: :taxation_form
  delegate :payment_period, to: :taxation_form

  def next_declaration_period
    declaration_period.next_period
  end

  def next_payment_period
    payment_period.next_period
  end

  def rate
    case tax_name
    when 'Единый налог'
      '109.22'
    when 'УСН'
      '5% от выручки'
    end
  end
end
