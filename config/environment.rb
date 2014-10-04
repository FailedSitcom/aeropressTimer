# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.gmail.com',
  :port => 587,
  :user_name => ENV[MAIL_USER],
  :password => ENV[MAIL_PASS],
  :authentication => :plain,
  :enable_starttls_auto => true,
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
