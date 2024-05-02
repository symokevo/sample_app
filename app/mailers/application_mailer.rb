class ApplicationMailer < ActionMailer::Base
  protect_from_forgery with: :null_session
  default from: "symokevo@outlook.com"
  layout "mailer"
end
