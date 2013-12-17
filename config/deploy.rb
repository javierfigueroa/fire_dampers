require 'capistrano/ext/multistage'

set :application, "fire_dampers"
set :rails_env, "production" #added for delayed job  
set :scm, :git
set :repository, "git@bitbucket.org:javierfigueroa/fire_dampers.git"
set :deploy_via, :remote_cache
set :scm_passphrase, "thegrassisgreen"
set :user, "admin"
set :default_environment, {'BASH_ENV' =>"~/.bashrc", 'SSH_ASKPASS' =>'/Users/admin/pwd.sh'}
set :stages, ["production"]
set :default_stage, "production"

namespace :deploy do
  task :restart, :roles => :web do
    run "cd #{current_path}; sudo thin stop"
    run "cd #{current_path}; sudo thin start -d -p 8080 -e production"
  end
  
  task :restart_daemons, :roles => :app do
     run "cd #{current_path}; chmod a+rwx bin/wkhtmltopdf-OS-X.ppc"
     run "cd #{current_path}; RAILS_ENV=#{rails_env} sudo script/delayed_job -n 2 restart"
  end
  
end

#To run the delayed job in development run
#development: rake jobs:work

after "deploy", "deploy:restart_daemons" 
# load 'deploy/assets'