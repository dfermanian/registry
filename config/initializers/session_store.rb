# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {

  :key         => '_ptnd_session',
  :secret      => '2fd535d68f4e61f27ab00daff9dfe06843a70444868111bf268314e5e3908da52c63d7ed211ade07d4c0955a6144408153e75b24507e2559eb9f94f92e7074a8'

}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
