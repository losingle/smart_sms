# require 'rails/all'
require 'action_controller/railtie'
require 'action_view/railtie'

require 'fake_app/active_record/config' if defined? ActiveRecord

# Config
app = Class.new(Rails::Application)
app.config.secret_token = '3b7cd727ee24e8444053437c36cc66c4'
app.config.session_store :cookie_store, key: '_myapp_session'
app.config.active_support.deprecation = :log
app.config.eager_load = false

# Rais.root
app.config.root = File.dirname(__FILE__)
Rails.backtrace_cleaner.remove_silencers!
app.initialize!

# Initializer
require 'fake_app/initializers/smart_sms'

# Model
require 'fake_app/active_record/models' if defined? ActiveRecord
