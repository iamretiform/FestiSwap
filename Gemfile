source 'https://rubygems.org'
gem 'react-rails', '~> 1.5.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.0.rc1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'materialize-sass'
gem 'sass-rails', github: 'rails/sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'aws-sdk'
gem 'devise'
gem 'diff-lcs'
gem 'figaro'
gem 'fog'
gem 'friendly_id'
gem 'geocoder'
gem 'htmlbeautifier'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'material_icons'
gem 'nested_scaffold'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'open_uri_redirections'
gem 'paperclip', git: 'git://github.com/thoughtbot/paperclip.git'
gem 'sidekiq'
gem 'coveralls', require: false

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end

group :test do
  gem 'rspec-sidekiq'
  gem 'shoulda-matchers', '~> 3.0', require: false
end

group :development, :test do
  gem 'rspec-rails'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry'

  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13.0'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'faker', github: 'stympy/faker'
  gem 'foreman'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'mini_racer', platforms: :ruby
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
