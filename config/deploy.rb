# config valid only for Capistrano 3.1
lock '3.1.0'

set :stages, %w(production staging)

set :password, ask('Server password', nil)
server '173.255.197.224', user: 'root', roles: %w{web app db}, password: fetch(:password)

task :production do
  set :rails_env, 'production'
  set :deploy_to, "/var/www/#{fetch(:application)}_production"
end

task :staging do
  set :rails_env, 'staging'
  set :deploy_to, "/var/www/#{fetch(:application)}_staging"
end

set :repo_url, 'https://github.com/juli0w/lp.git'
set :application, 'lojadopintor'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_via, :remote_cache
set :tmp_dir, '/tmp/'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 2