# frozen_string_literal: true

class TaxesBuilderPresenter < BasePresenter
  class UnknownPeriodType < StandardError; end

  delegate :name, to: :taxation_form, prefix: :tax
  delegate :period_type, to: :taxation_form
  delegate :name, to: :model, prefix: :organization
  delegate :declaration_period_in_days, to: :taxation_form

  def period_event
    declaration_period_start..declaration_period_end
  end

  def declaration_period_start
    Date.new(closest_declaration_year, closest_declaration_month, 1)
  end

  def declaration_period_end
    declaration_period_start + declaration_period_in_days.days
  end

  def closest_declaration_year
    send(:"closest_declaration_year_for_#{period_type}")
  end

  def closest_declaration_month
    send(:"closest_declaration_month_for_#{period_type}")
  end

  def rate
    case tax_name
    when 'Единый налог'
      '109.22'
    when 'УСН'
      '5% от выручки'
    end
  end

  private

  def closest_declaration_year_for_month
    current_year + closest_declaration_month_for_month / 12
  end

  def closest_declaration_month_for_month
    current_month + 1
  end

  def closest_declaration_year_for_year
    current_year + 1
  end

  def closest_declaration_month_for_year
    1
  end

  def closest_declaration_year_for_quarter
    current_year + closest_declaration_month_for_quarter / 12
  end

  def closest_declaration_month_for_quarter
    current_month + (3 - current_month % 3) + 1
  end

  delegate :year,  to: :current_date, prefix: :current
  delegate :month, to: :current_date, prefix: :current

  def current_date
    @current_date ||= Time.zone.today
  end
end
