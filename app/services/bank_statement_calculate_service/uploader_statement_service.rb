# frozen_string_literal: true

module BankStatementCalculateService
  class UploaderStatementService
    def self.upload(file)
      File.read(file)
    end
  end
end
