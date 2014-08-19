source 'https://rubygems.org'

# base gems
gem 'rails', '4.1.5'
gem 'sqlite3'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'unicorn'

#assets and js
gem 'sass-rails', '~> 4.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'

# views
gem "haml-rails"

# ember and JSON API related
gem 'ember-rails'
gem "active_model_serializers"
gem 'jbuilder', '~> 1.2'

# external dependencies
gem 'asana_to_sig', :path => 'asana_to_sig/'
gem 'naught'

group :doc do
  gem 'sdoc', require: false
end

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
  gem 'simplecov', :require => false, :group => :test
end



