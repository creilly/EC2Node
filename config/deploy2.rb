$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_ruby_string, "1.9.2"
set :rvm_type, :user
set :use_sudo, false

set :stages, %w(acceptance production)
set :default_stage, 'acceptance'
require 'capistrano/ext/multistage'


set :application, "node"
set :user, "ubuntu"
set :host, "ec2-184-72-12-121.us-west-1.compute.amazonaws.com"
set :deploy_to, "/var/www/node"



set :scm, :git
set :repository, "git@github.com:jackdreilly/EC2Node.git"
set :branch, "development"

set :deploy_via, :remote_cache
role :app, host

bluepill = 'bluepill'

default_run_options[:pty] = true


namespace :deploy do
  task :start, :roles => :app, :except => { :no_release => true } do
    run "#{bluepill} start #{application}"
  end

  task :stop, :roles => :app, :except => { :no_release => true } do
    run "#{bluepill} stop #{application}"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{bluepill} restart #{application}"
  end

  task :create_deploy_to_with_sudo, :roles => :app do
    run "#{try_sudo :as => 'root'} mkdir -p #{deploy_to}"
  end

  task :npm_install, :roles => :app, :except => { :no_release => true } do
    run "cd #{release_path} && npm install"
  end
end

require 'bundler/capistrano'

before 'deploy:setup', 'deploy:create_deploy_to_with_sudo'
after 'deploy:finalize_update', 'deploy:npm_install'
