# frozen_string_literal: true

module BankStatementCalculateService
  class BankStatementService
    attr_reader :bank_name, :type_file, :file
    def initialize(bank_name, type_file, file)
      @bank_name = bank_name
      @type_file = type_file
      @file = file
    end

    def fetch
      case bank_name
      when :bgpb
        BankStatementBgpbService.new(bank_name, type_file, file)
      end
    end
  end
end
