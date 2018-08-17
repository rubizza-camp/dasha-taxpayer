# frozen_string_literal: true

module BankStatementCalculateService
  class ParserCsvStatementBgpbService
    def self.parse(csv_file)
      csv_text = UploaderStatementService.upload(csv_file)
      csv_text = StringHandlingHelper.delete_first_sym_bom(csv_text)
      CSV.parse(csv_text, col_sep: ';', headers: true)
    end
  end
end
