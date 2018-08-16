# frozen_string_literal: true

module BankStatementCalculateService
  class BankStatementBgpbService
    attr_reader :type_file, :file
    def initialize(type_file, file)
      @type_file = type_file
      @file = file
    end

    def parse
      ParserStatementService.new(type_file, file).parse
    end

    def handling_data(data_statement)
      case type_file
      when :csv
        BgpbCsvHandlingService.fetch(data_statement)
      end
    end
  end
end
