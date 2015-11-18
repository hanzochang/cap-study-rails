set :stage, :development

set :branch, 'master'

role :app, %w{vagrant@192.168.63.23}

server '192.168.63.23',
user: 'vagrant',
roles: %w{web},
ssh_options: {
  password: 'vagrant'
}

set :deploy_to, '/var/apps'

set :rails_env, :development
