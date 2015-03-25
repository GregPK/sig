ruby '2.0.0'
source 'https://rubygems.org'


# base gems
gem 'rails', '~> 4.1'
gem 'mysql2'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'unicorn'

#assets and js
gem 'sass-rails', '~> 4.0'
gem 'coffee-rails', '~> 4.0'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails', '3.0.3'

# views
gem "haml-rails"

# ember and JSON API related
gem 'ember-rails', '0.14'
gem 'ember-source', '1.1.2'
# gem 'handlebars-source', '1.0.12'

gem "active_model_serializers"
gem 'jbuilder', '~> 1.2'

# external dependencies
gem 'asana_to_sig', :path => 'asana_to_sig/'
gem 'naught'

# old compatibility gems
gem 'responders', '~> 2.0'

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

gem 'rails_12factor', group: :production

gem 'rake' # openshift needs this

