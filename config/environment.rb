# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
    :password => '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', # This is the secret sendgrid API key which was issued during API key creation
    :domain => 'http://salty-reaches-96405.herokuapp.com/',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }
  
