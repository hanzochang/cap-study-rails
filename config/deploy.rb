# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'cap_study_rails'
set :repo_url, 'https://github.com/hanzochang/cap-study-rails'

set :rbenv_type, :user
set :rbenv_ruby, '2.2.3'

set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all

before 'deploy:starting', 'deploy:unistop'
after 'deploy:publishing', 'deploy:restart'

# TODO そのうち/etc/init.d/unicornに追加してserviceとして制御する
namespace :deploy do
  task :unistop do
    invoke 'unicorn:stop'
  end

  task :restart do
    invoke 'unicorn:restart'
  end
end
