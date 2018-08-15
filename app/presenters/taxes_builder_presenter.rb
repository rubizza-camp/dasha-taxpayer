# frozen_string_literal: true

class TaxesBuilderPresenter < BasePresenter
  class UnknownPeriodType < StandardError; end

  delegate :name, to: :taxation_form, prefix: :tax
  delegate :name, to: :model, prefix: :organization
  delegate :id, to: :model, prefix: :organization
  delegate :declaration_event, to: :taxation_form
  delegate :payment_event, to: :taxation_form

  def next_declaration_event
    declaration_event.next_event
  end

  def next_payment_event
    payment_event.next_event
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
