# frozen_string_literal: true

module BankStatementCalculateService
  class BankStatementBgpbService
    attr_reader :bank_name, :type_file, :file
    def initialize(bank_name, type_file, file)
      @bank_name = bank_name
      @type_file = type_file
      @file = file
    end

    def parse
      ParserStatementService.new(bank_name, type_file, file).parse
    end

    def handling_data(data_statement)
      case type_file
      when :csv
        BgpbCsvHandlingService.fetch(data_statement)
      end
    end
  end
end
