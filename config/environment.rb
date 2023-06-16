# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

if Rails.application.respond_to?(:encrypted?) && Rails.application.encrypted?
  Rails.application.credentials.decrypt
end
