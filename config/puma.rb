# Puma configuration file.

# Number of threads to use
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
port ENV.fetch("PORT") { 3000 }

# Specifies the `environment` that Puma will run in.
environment ENV.fetch("RAILS_ENV") { ENV['RACK_ENV'] || "development" }

# Specifies the `pidfile` that Puma will use.
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# Number of worker processes to use
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Preload the application before starting the workers.
preload_app!

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
