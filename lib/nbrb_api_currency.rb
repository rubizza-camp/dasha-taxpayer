# frozen_string_literal: true

module NbrbApi
  class NbrbError < StandardError; end

  URL = 'http://www.nbrb.by/API/ExRates/Rates'.freeze

  module Curencies
    def self.currency_official_rate(curr, date)
      currency = "/#{curr}"
      uri = URI.parse(URL + currency)
      params = {ParamMode: '2', onDate: date, Periodicity: '0'}
      uri.query = URI.encode_www_form(params)
      response = Net::HTTP.get_response(uri)
      content = response.body
      rate_hash = JSON.parse(content)
      official_rate = rate_hash['Cur_OfficialRate']
      scales_foreign_currency_unit = rate_hash['Cur_Scale']
      (official_rate / scales_foreign_currency_unit).round(2)
    end
  end
end
