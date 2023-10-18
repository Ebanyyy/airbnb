set :stage,           :production
set :rails_env,       :productiom
set :branch,          :main

set :application,     'airbnb'
set :deploy_to,       "/home/#{fetch(:user)}/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/sockets/puma.sock"

server '13.212.35.55', user: fetch(:user), roles: [:web, :app, :db], primary: true