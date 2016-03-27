SSHKit.config.command_map[:rake] = "bundle exec rake"
lock '3.4.0'
set :application, 'coderstrust'
set :scm, :git
set :repo_url, 'git@gitlab.com:mhb87/tangail.git'
set :deploy_via, :remote_cache

server '188.166.172.38',
       :user => 'root',
       :roles => %w{web app db}

set :rvm_roles, [:app, :web]
set :rvm_type, :system
set :rvm_ruby_version, 'ruby-2.2.1'
set :rvm_path, '/usr/local/rvm'

#set :format, :pretty
set :log_level, :debug
set :pty, true
set :linked_files, %w{config/application.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets public/uploads}

set :keep_releases, 10

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
