source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Repository for collecting Locale data for Ruby on Rails I18n as well as other interesting, Rails related I18n stuff
gem 'rails-i18n'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# A pure ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard.
gem 'jwt'
# Token based authentication for Rails JSON APIs. Designed to work with jToker and ng-token-auth.
gem 'devise_token_auth'
gem 'devise-i18n'
# Manage Procfile-based applications http://ddollar.github.com/foreman
gem 'foreman'
# A plugin for versioning Rails based RESTful APIs.
gem 'versionist'
# A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for Ruby webapps
gem 'kaminari'
# Link header pagination for Rails and Grape APIs.
# gem 'api-pagination'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', platform: :ruby

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
# ActiveModel::Serializer implementation and Rails hooks
gem 'active_model_serializers'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # A library for generating fake data such as names, addresses, and phone numbers. 
  gem 'faker'
  # Rails >= 3 pry initializer
  gem 'pry-rails'
end

group :development do
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
