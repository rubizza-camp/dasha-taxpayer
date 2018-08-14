class StatementLoadersController  < ApplicationController
  
  skip_before_action :verify_authenticity_token

  def new
    @organization = Organization.find(params[:id])
  end

  def show
  end

  def extract_tax
    if params[:my_file] != nil
      tmp = params[:my_file].tempfile
      csv_text = File.read(tmp)
      csv = CSV.parse(csv_text, :headers => true)
      array_obj = ParserCsv.new(csv).fetch
      @data = HandlingData.new(array_obj)
      render :show, data: @data
    end
  end
end

class ParserCsv
  attr_reader :csv
  def initialize(csv)
    @csv = csv
  end

  def fetch
    data_csv = []
    csv.each do |row|
      if row["Документ - Дата"] != nil
        statement_data = StatementData.new
        statement_data.document_data = row["Документ - Дата"]
        statement_data.nominal_debit = row["Номинал - Дебет"].to_f
        statement_data.equivalent_debit = row["Эквивалент - Дебет"].to_f
        statement_data.equivalent_debit_byn_nbrb = HandlingData.rate_byn(row["Документ - Дата"], row["Номинал - Дебет"], row["Корреспондент - Валюта"])
        statement_data.correspondent_currency = row["Корреспондент - Валюта"]
        data_csv.push(statement_data)
      end
    end
    data_csv
  end
end

class StatementData
  attr_accessor :document_data, :nominal_debit, :equivalent_debit,
                :equivalent_debit_byn_nbrb, :correspondent_currency
end

class HandlingData
  RATE_FIXED_TAX = 119.35
  RATE_USN       = 0.05
  attr_reader :data
  def initialize(data)
    @data = data
  end

  def self.rate_byn(date, amount, currency)
    tmp = currency_for_date(date, currency)
    amount = amount.to_f
    amount > 0 ? (tmp * amount).round(2) : 0
  end

  def self.currency_for_date(date, currency)
    2.0
  end

  def receipts
    data.sum(&:equivalent_debit_byn_nbrb).round(2)
  end

  def receipts_equivalent
    data.sum(&:equivalent_debit).round(2)
  end

  def exchange_difference
    (receipts_equivalent - receipts).round(2)
  end

  def gross_revenue
    (receipts + exchange_difference).round(2)
  end

  def sum_tax_for_usn
    (gross_revenue * RATE_USN).round(2)
  end

  def sum_tax_for_single
    RATE_FIXED_TAX
  end
end
