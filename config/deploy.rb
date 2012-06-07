# application domain
set :application, "72.29.94.226"

# how many releases should be kept in history
set :keep_releases, 5

# ssh options
default_run_options[:pty] = true
set :ssh_options, {:forward_agent => true}
set :use_sudo, true
set :deploy_via, :remote_cache

# your application repository
set :scm, "git"
set :repository,  "git@github.com:eder/hackerboard.git"

set :branch, "master"

# the deployer user
set :user, "web"
set :runner, "www-data"

# the application deployment path
set :deploy_to, "/home/hackerboard"
set :current, "#{deploy_to}/current"

# the ssh port
set :port, 3667

# set the roles
role :app, application
role :web, application
role :db,  application, :primary => true

after :deploy, "deploy:cleanup"
after :deploy, "app:setup"

namespace :deploy do
  task(:start) {}
  task(:stop) {}
  task(:restart, :roles => :app, :except => {:no_release => true}){}
end

namespace :app do
  desc "Copy configuration files"
  task :setup do
    run "rm #{current}/config/database.yml &> /dev/null; ln -s #{deploy_to}/config/database.yml #{current}/config/database.yml"
    run "#{try_sudo} chown -R www-data. #{deploy_to}"
  end
end
