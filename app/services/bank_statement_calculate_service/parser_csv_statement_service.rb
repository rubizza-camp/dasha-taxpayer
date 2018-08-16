# frozen_string_literal: true

module BankStatementCalculateService
  class ParserCsvStatementService
    def self.parse(csv_file)
      csv_text = UploaderStatementService.upload(csv_file)
      CSV.parse(csv_text, headers: true)
    end
  end
end
