# frozen_string_literal: true

module BankStatementCalculateService
  class CurrencyCalculatorService
    def self.rate_byn(date_select, amount, currency_rate)
      tmp = currency_for_date(date_select, currency_rate)
      amount = amount.to_f
      amount.positive? ? (tmp * amount).round(2) : 0
    end

    def self.currency_for_date(_date_select, _currency_rate)
      2.0
    end
  end
end
