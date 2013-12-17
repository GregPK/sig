source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

gem "haml-rails"

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'asana_to_sig', :path => 'asana_to_sig/'
gem 'naught'

gem 'ember-rails'
gem "active_model_serializers"

group :development do
  gem 'pry'
  gem "binding_of_caller"

  #code quality  
  gem 'sandi_meter'
  gem 'api_taster'
  
  # better logging and errors
  gem "awesome_print"
  gem "better_errors"
  gem 'annotate', ">=2.6.0"

  # guards
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'guard-test'
end

group :development, :test do
  gem "rspec-rails", '~> 3.0.0.beta'
  gem 'factory_girl_rails'
end


# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
