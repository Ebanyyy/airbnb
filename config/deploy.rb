# config valid for current version and patch releases of Capistrano
lock '~> 3.17.0'

# Change these
set :repo_url,        "git@github.com:Ebanyyy/airbnb.git"
set :user,            "deploy"

# Don't change these unless you know what you're doing
set :pty,             false
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa) }
set :nginx_use_ssl,   true

## Defaults:
set :format,        :pretty
set :log_level,     :debug
set :keep_releases, 5

## Linked Files & Directories (Default None):
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/puma.rb', 'config/master.key', 'sockets/puma.sock')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads', 'sockets')

# Skip Sprockets build in favour of Webpacker.
Rake::Task['deploy:assets:backup_manifest'].clear_actions

# SSHKit.config.command_map[:sidekiq] = 'bundle exec sidekiq'
# SSHKit.config.command_map[:sidekiqctl] = 'bundle exec sidekiqctl'

namespace :deploy do
  after 'deploy:restart', 'deploy:cleanup'
end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop pumathe following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
