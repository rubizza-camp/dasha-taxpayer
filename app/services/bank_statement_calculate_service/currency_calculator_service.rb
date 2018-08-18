# frozen_string_literal: true

require 'nbrb_api_currency'

module BankStatementCalculateService
  class CurrencyCalculatorService
    def self.rate_byn(date_select, amount, currency_rate)
      tmp = currency_for_date(date_select, currency_rate)
      amount = amount.to_f
      amount.positive? ? (tmp * amount).round(2) : 0
    end

    def self.currency_for_date(date_select, currency_rate)
      currency_rate = currency_rate.upcase
      date_select = Date.parse(date_select).strftime('%Y-%-m-%-d')
      NbrbApi::Curencies.currency_official_rate(currency_rate, date_select)
    end
  end
end
