# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgird.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'apikey',
  :password       => ENV['SENDGRID_API_KEY'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}
