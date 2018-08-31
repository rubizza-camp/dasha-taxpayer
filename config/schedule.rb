#job_type :sidekiq, "cd :path && RAILS_ENV=:enviroment /usr/local/bin/bundle exec /usr/local/bin/sidekiq-client :task :output"
job_type :sidekiq, "cd :path && RAILS_ENV=:enviroment /home/ruby/.rvm/gems/ruby-2.5.1/bin/bundle exec /home/ruby/.rvm/gems/ruby-2.5.1/bin/sidekiq-client :task :output"
#$PATH:$HOME/.rvm/bin
#job_type :sidekiq, "cd :path && :environment_variable=:environment bundle exec sidekiq-client push :task :output"
set :output, error: 'error.log', standard: 'cron.log'
set :enviroment, :development

binding.pry
every 1.minutes do
  sidekiq 'push TaxesAndTasksGeneratorWorker'
end