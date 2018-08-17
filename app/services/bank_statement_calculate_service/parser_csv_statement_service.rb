# frozen_string_literal: true

module BankStatementCalculateService
  class ParserCsvStatementService
    # This method smells of :reek:ControlParameter:
    def self.parse(csv_file, bank_name)
      case bank_name
      when :bgpb
        ParserCsvStatementBgpbService.parse(csv_file)
      end
    end
  end
end
