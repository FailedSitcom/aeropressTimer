# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :address => 'server62.web-hosting.com',
  :port => 465,
  :user_name => "hello@coffeefilter.me",
  :password => "Cassandra87",
  :authentication => :plain,
  :enable_starttls_auto => true,
}

ActionMailer::Base.default_url_options[:host] = "coffeefilter.com"
