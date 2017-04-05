# config valid only for current version of Capistrano
lock "3.7.2"

set :application, "api"
set :repo_url, "git@github.com:team-kektus/api.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/kektus/#{fetch(:application)}"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

set :format, :pretty

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5


set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip

set :linked_dirs, %w{tmp/sockets tmp/pids}
set :linked_files, %w{.rbenv-vars}

set :puma_conf, "#{release_path}/config/puma.rb"


namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  before :starting,     :check_revision

end
