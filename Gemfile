# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.2.2"

gem "rails", "~> 7.1.1"

gem "sprockets-rails"

gem "sqlite3", "~> 1.4"

gem 'pg'

gem "puma", ">= 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem "tzinfo-data", platforms: %i[windows jruby]

gem "bootsnap", require: false

gem "pry", "~> 0.14.2"

gem "pry-remote", "~> 0.1.8"

gem "redis"

gem "sidekiq"

gem "devise"

group :development, :test do
  gem "rspec-rails", "~> 6.1.0"

  gem "debug", platforms: %i[mri windows]

  gem "rubocop", "~> 1.60", require: false

  gem "rubocop-graphql", "~> 1.4"

  gem "rubocop-performance", "1.19.0"

  gem "rubocop-rails", "2.20.2"

  gem "rubocop-rspec", "2.23.2"

  gem "factory_bot_rails"
end

group :development do
  gem "web-console"
end

group :test do
  gem 'shoulda-matchers', '~> 6.0'
  gem 'simplecov', require: false
end