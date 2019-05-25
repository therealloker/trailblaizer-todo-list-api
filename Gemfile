source 'https://rubygems.org'

ruby '2.6.3'

gem 'rails', '~> 5.2.2.1'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'pg', '~> 1.1.4'
gem 'puma', '~> 3.11'

gem 'reform-rails'
gem 'trailblazer-endpoint', github: 'trailblazer/trailblazer-endpoint'
gem 'trailblazer-rails'

group :development, :test do
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'ffaker'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'json_matchers'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
end
