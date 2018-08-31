# frozen_string_literal: true

job_type :sidekiq, 'cd :path && RAILS_ENV=:enviroment /usr/local/bin/bundle exec /usr/local/bin/sidekiq-client :task :output'
# job_type :sidekiq, 'cd :path && RAILS_ENV=:enviroment /home/ruby/.rvm/gems/ruby-2.5.1/bin/bundle ' +
#                 + 'exec /home/ruby/.rvm/gems/ruby-2.5.1/bin/sidekiq-client :task :output'
set :output, error: 'error.log', standard: 'cron.log'
set :enviroment, :development

every 1.minute do
  sidekiq 'push TaxesAndTasksGeneratorWorker'
end
