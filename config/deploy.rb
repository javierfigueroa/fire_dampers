require 'capistrano/ext/multistage'

set :application, "fire_dampers"
set :scm, :git
# set :scm_command, "/opt/local/bin/git" 
set :repository, "git@bitbucket.org:javierfigueroa/fire_dampers.git"
set :deploy_via, :remote_cache
set :scm_passphrase, "thegrassisgreen"
set :user, "admin"
set :default_environment, {'BASH_ENV' =>"~/.bashrc", 'SSH_ASKPASS' =>'/Users/admin/pwd.sh'}
set :stages, ["production"]
set :default_stage, "production"

namespace :deploy do
  task :start, :roles => :web do
    sudo "cd #{ current_path }"
    sudo "thin start -d -p 8080 -e production"
  end
  task :stop, :roles => :web do
    sudo "cd #{ current_path }"
    sudo "thin stop"
  end
  task :restart, :roles => :web do
    sudo "cd #{ current_path }"
    sudo "thin restart -d -p 8080 -e production"
  end
  
  task :restart_daemons, :roles => :app do
    # sudo "cd #{ current_path }"
    # sudo "chmod a+rx bin/wkhtmltopdf-OS-X.ppc"
    # sudo "script/delayed_job start"
  end
end

#To run the delayed job in development run
#development: rake jobs:work

after "deploy", "deploy:restart_daemons" 

#load 'deploy/assets'

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end