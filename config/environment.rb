# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :address => 'www.coffeefilter.me',
  :port => 465,
  :user_name => "hello@coffeefilter.me",
  :password => "Cassandra87",
  :authentication => :plain,
  :enable_starttls_auto => true,
  :openssl_verify_mode => 'none'
}

ActionMailer::Base.default_url_options[:host] = "www.coffeefilter.me"
