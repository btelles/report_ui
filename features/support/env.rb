ENV["RAILS_ENV"] ||= "test"
require File.expand_path(File.dirname(__FILE__) + '/../../fixture_rails_root/config/environment')

def load_schema
  config = YAML::load(IO.read(File.dirname(__FILE__) + '/../../fixture_rails_root/config/database.yml'))
  ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + '/debug.log')
  db_adapter = 'sqlite3'
  ActiveRecord::Base.establish_connection(config[db_adapter])
  load(File.dirname(__FILE__) + '/../../fixture_rails_root/db/schema.rb')
  #require File.dirname(__FILE__) + '/../../init'
end

load_schema
require File.dirname(__FILE__) + '/models'
require File.dirname(__FILE__) + '/blueprints'
require 'cucumber/formatter/unicode' # Remove this line if you don't want Cucumber Unicode support
require 'cucumber/rails/world'
require 'cucumber/rails/active_record'
require 'cucumber/web/tableish'

require 'capybara/rails'
require 'capybara/cucumber'
require 'capybara/session'
#require 'capybara/envjs'
#require 'capybara_envjs_fixes/cucumber_fixes'

Capybara.default_driver = :selenium
#Capybara.default_host= '127.0.0.1'
Capybara.default_selector = :css
ActionController::Base.allow_rescue = false
Cucumber::Rails::World.use_transactional_fixtures = true

if defined?(ActiveRecord::Base)
  begin
    require 'database_cleaner'
    DatabaseCleaner.strategy = :truncation
  rescue LoadError => ignore_if_database_cleaner_not_present
  end
end
