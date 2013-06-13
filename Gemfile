source 'http://rubygems.org'

gem 'rails', '3.2.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
#Bundler.setup
gem 'devise'
gem 'devise-encryptable'
gem 'cancan'
gem "wkhtmltopdf-heroku"
gem 'wicked_pdf'
gem 'aws-sdk'
gem "paperclip", "~> 2.7"
gem 'aws-s3'
gem 'delayed_job_active_record'
gem 'rake', '~>10.0.4'
gem 'builder', '~>3.0.4'
gem 'thin'

group :production do
  gem "mysql", "~>2.8.1"
end

group :development, :test do
  gem 'sqlite3-ruby', '1.2.5', :require => 'sqlite3'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'
gem 'capistrano-ext'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end