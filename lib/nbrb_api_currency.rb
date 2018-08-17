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
      p response.read_header
      prepared_data(response.body)
      # if response.code == 200
      #   prepared_data(response.body)
      # else
      #   puts "ERROR: #{response.read_header} (#{response.code})"
      # end
    end

    def self.prepared_date(date)
      year = Date.parse(date.to_s).year
      month = Date.parse(date.to_s).month
      day = Date.parse(date.to_s).day
      "#{year}-#{month}-#{day}"
    end

    def self.prepared_data(content)
      rate_hash = JSON.parse(content)
      official_rate = rate_hash['Cur_OfficialRate']
      scales_foreign_currency_unit = rate_hash['Cur_Scale']
      p rate_hash['Date']
      (official_rate / scales_foreign_currency_unit).round(2)
    end
  end
end
