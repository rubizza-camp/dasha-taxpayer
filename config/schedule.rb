# frozen_string_literal: true

job_type :sidekiq, 'cd :path && RAILS_ENV=:enviroment /usr/local/bin/bundle exec /usr/local/bin/sidekiq-client :task :output'

set :output, error: 'error.log', standard: 'cron.log'
set :enviroment, :development

every 2.minutes do
  sidekiq 'push TaxesAndTasksGeneratorWorker'
end
