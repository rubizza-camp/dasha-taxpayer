# frozen_string_literal: true

module BankStatementCalculateService
  class ParserStatementService
    attr_reader :bank_name, :type_file, :file
    def initialize(bank_name, type_file, file)
      @bank_name = bank_name
      @type_file = type_file
      @file = file
    end

    def parse
      case type_file
      when :csv
        ParserCsvStatementService.parse(file, bank_name)
      end
    end
  end
end
