# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_testing_tools_test_session',
  :secret      => 'a4ec404d390e503cb2b651427792ab8f95f1da9d5edcbe417da7e234d9599213ca31fd8e1517a394569ae7717e54df118f53e88a6acfd201ee59f9dc91282c0d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
