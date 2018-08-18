# frozen_string_literal: true

module NbrbApi
  class NbrbError < StandardError; end

  URL = 'http://www.nbrb.by/API/ExRates/Rates'

  module Curencies
    def self.currency_official_rate(curr='USD', date)
      uri = URI.parse(URL + "/#{curr}")
      params = {ParamMode: '2', onDate: prepared_date(date), Periodicity: '0'}
      uri.query = URI.encode_www_form(params)
      response = Net::HTTP.get_response(uri)
      prepared_data(response.body)
    end

    def self.prepared_date(date)
      year = parsing_year(date)
      month = parsing_month(date)
      day = parsing_day(date)
      "#{year}-#{month}-#{day}"
    end

    def self.parsing_day(date)
      Date.parse(date.to_s).day
    end

    def self.parsing_month(date)
      Date.parse(date.to_s).month
    end

    def self.parsing_year(date)
      Date.parse(date.to_s).year
    end

    def self.prepared_data(content)
      rate_hash = JSON.parse(content)
      official_rate = rate_hash['Cur_OfficialRate']
      scales_foreign_currency_unit = rate_hash['Cur_Scale']
      (official_rate / scales_foreign_currency_unit).round(2)
    end
  end
end
