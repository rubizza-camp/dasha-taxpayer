# frozen_string_literal: true

module BankStatementCalculateService
  class ParserStatementService
    attr_reader :type_file, :file
    def initialize(type_file, file)
      @type_file = type_file
      @file = file
    end

    def parse
      case type_file
      when :csv
        ParserCsvStatementService.parse(file)
      end
    end
  end
end
