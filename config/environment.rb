# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['MAIL_ADRESS'],
  :password       => ENV['APP_PASSWORD'],
  :domain         => 'smtp.gmail.com',
  :enable_starttls_auto => true
}