# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    address:         'smtp.gmail.com',
    port:            587,
    user_name:       ENV['GOOGLE_SMTP_GMAIL'],
    password:        ENV['GOOGLE_SMTP_PASSWORD'],
    authentication: "plain",
    enable_starttls_auto: true
  }
