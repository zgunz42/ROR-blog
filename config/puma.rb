workers Integer(ENV['WEB_CONCURRENCY'] || 1)
threads_count_max = Integer(ENV['RAILS_MAX_THREADS'] || 1)
threads_count_min = Integer(ENV['RAILS_MAX_THREADS'] || 1)
threads threads_count_max, threads_count_min


preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end