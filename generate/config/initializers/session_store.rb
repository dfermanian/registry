# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_generate_session',
  :secret      => '8a4887bfcc020fa7f2deb8e4a6221e69b1e3d9a98d643d258198a8896913d10a8c8911894ca17aa5ea77b1827e55263cd85a1855a57f686bec9e090a999a54be'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
