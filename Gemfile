source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Mongoid is an ODM (Object Document Mapper) Framework for MongoDB, written in Ruby.
gem 'mongoid', '~> 7.1', '>= 7.1.2'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# Flexible authentication solution for Rails with Warden
gem 'devise', '~> 4.7', '>= 4.7.2'
# An extension that becomes possible use paginate method with Mongoid
gem 'will_paginate_mongoid', '~> 2.0', '>= 2.0.1'
# Validate, generate and format CPF/CNPJ numbers. Include command-line tools. 
gem 'cpf_cnpj', '~> 0.5.0'
# Provides the generator settings required for Rails 3+ to use Slim
gem 'slim-rails', '~> 3.2'
# Use Pry as your rails console
gem 'pry-rails', '~> 0.3.9'
# Great Ruby dubugging companion: pretty print Ruby objects to visualize their structure. Supports custom object formatting via plugins
gem 'awesome_print', '~> 1.8'
# Feature rich logging framework that replaces the Rails logger.
gem 'rails_semantic_logger', '~> 4.4', '>= 4.4.4'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end