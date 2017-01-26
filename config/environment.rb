# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

if $0 == 'irb'
  require 'hirb'
  Hirb.enable
end
