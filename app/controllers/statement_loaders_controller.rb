# frozen_string_literal: true

class StatementLoadersController < ApplicationController

  def new
    @organization = Organization.find(params[:id])
  end

  def show; end

  def extract_tax
    raise 'Exception Upload CSV' if params[:my_file].blank?
    tmp = params[:my_file].tempfile
    csv_text = File.read(tmp)
    csv = CSV.parse(csv_text, headers: true)
    array_obj = BgpbCsvParser.new(csv).fetch
    @data_statement = select_type_tax(params[:id]).new(array_obj)
    render :show, data: @data_statement
  end

  def redirect_taxes
    redirect_to taxes_path
  end

  private

  def select_type_tax(organization_id)
    @organization = Organization.find(organization_id)
    case @organization.taxation_form.name
    when 'УСН'
      CalculateExtractForUsn
    when 'Единый налог'
      CalculateExtractForSingle
    end
  end
end

class BgpbCsvParser
  attr_reader :csv
  def initialize(csv)
    @csv = csv
  end

  def fetch
    data_csv = csv.map do |row|
      document_data = row['Документ - Дата']
      next if document_data.blank?
      statement_data = StatementData.new
      statement_data.document_data = document_data
      statement_data.nominal_debit = row['Номинал - Дебет'].to_f
      statement_data.equivalent_debit = row['Эквивалент - Дебет'].to_f
      statement_data.correspondent_currency = row['Корреспондент - Валюта']
      statement_data.equivalent_debit_byn_nbrb = CurrencyCalculator.rate_byn(statement_data.document_data,
                                                                           statement_data.nominal_debit, statement_data.correspondent_currency)
      statement_data
    end
    data_csv.reject(&:blank?)
  end
end

class StatementData
  attr_accessor :document_data, :nominal_debit, :equivalent_debit,
                :equivalent_debit_byn_nbrb, :correspondent_currency
end

class CurrencyCalculator
  def self.rate_byn(date_select, amount, currency_rate)
    tmp = currency_for_date(date_select, currency_rate)
    amount = amount.to_f
    amount.positive? ? (tmp * amount).round(2) : 0
  end

  def self.currency_for_date(_date_select, _currency_rate)
    2.0
  end
end

class CalculateExtract
  attr_reader :objects_statement_data
  def initialize(objects_statement_data)
    @objects_statement_data = objects_statement_data
  end

  def receipts
    objects_statement_data.sum(&:equivalent_debit_byn_nbrb).round(2)
  end

  def receipts_equivalent
    objects_statement_data.sum(&:equivalent_debit).round(2)
  end

  def exchange_difference
    (receipts_equivalent - receipts).round(2)
  end

  def gross_revenue
    (receipts + exchange_difference).round(2)
  end

  def sum_tax; end
end

class CalculateExtractForUsn < CalculateExtract
  RATE_USN = 0.05
  def sum_tax
    (gross_revenue * RATE_USN).round(2)
  end
end

class CalculateExtractForSingle < CalculateExtract
  RATE_FIXED_TAX = 119.35
  def sum_tax
    RATE_FIXED_TAX
  end
end
