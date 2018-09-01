# frozen_string_literal: true

class TaxesAndTasksGeneratorWorker
  include Sidekiq::Worker

  # This method smells of :reek:UtilityFunction
  def perform
    TaxesAndTasksGenerator.call
  end
end
