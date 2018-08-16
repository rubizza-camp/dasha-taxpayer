# frozen_string_literal: true

module BankStatementCalculateService
  class BankStatementService
    def initialize(bank_name)
      @bank_name = bank_name
    end

    def fetch
      case @bank_name
      when :bgpb
        BankStatementBgpbService
      end
    end
  end
end
