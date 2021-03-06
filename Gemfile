# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 2.6.5'

gem 'rails', '~> 6.0.1'
gem 'sassc-rails'
gem 'ddtrace'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'jbuilder', '~> 2.7'
gem 'mdl_form', github: 'bjelline/rails-mdl-form'
gem 'pg'
gem 'puma', '~> 4.1'
gem 'rswag-api'
gem 'rswag-ui'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'webpacker-react'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '= 4.0.0.beta3'
  gem 'rswag-specs'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
  gem "capistrano", "~> 3.10", require: false
  gem "capistrano-rails", "~> 1.3", require: false
  gem 'capistrano-rbenv', '~> 2.1', require: false
  gem 'capistrano-passenger', require: false
  gem 'capistrano-bundler', '~> 1.6', require: false
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem "rack-cors", "~> 1.1"

gem "fast_jsonapi", "~> 1.5"
