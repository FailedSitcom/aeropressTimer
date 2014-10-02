source 'https://rubygems.org'




# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
gem 'bcrypt', '~> 3.1.2'
# Use sqlite3 as the database for Active Record
group :production do
  gem 'pg'
  gem 'rails_12factor'
end



# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
gem 'mail', '~> 2.5.4'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

gem 'foundation-rails', '~> 5.2.2'
gem 'font-awesome-rails', '~> 4.1.0.0'
gem 'jquery-countdown-rails'

group :development do
  gem 'spring'
  gem 'quiet_assets', '~> 1.0.2'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development, :test do
  gem 'rspec-rails', '~> 2.0'
  gem 'factory_girl_rails', '~> 4.0'
end

group :test do
  gem 'capybara', '~> 2.1.0'
  gem "capybara-email", "~> 2.2.0"
  gem 'shoulda', '~> 3.5.0'
end
