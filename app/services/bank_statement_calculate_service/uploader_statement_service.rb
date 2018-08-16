# frozen_string_literal: true

module BankStatementCalculateService
  class UploaderStatementService
    def self.upload(file)
      tmp = file.tempfile
      File.read(tmp)
    end
  end
end
