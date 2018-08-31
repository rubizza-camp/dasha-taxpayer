class TaxesAndTasksGeneratorWorker
  include Sidekiq::Worker

  def perform(*args)
    #TaxesAndTasksGenerator.call
    command "echo 'hello from rails!!!'"
    binding.pry
    sleep 10
  end
end
