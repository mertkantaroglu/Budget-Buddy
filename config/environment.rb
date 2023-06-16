# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.credentials.decrypt if Rails.application.encrypted?
