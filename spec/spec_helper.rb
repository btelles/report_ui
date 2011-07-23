ENV["RAILS_ENV"] ||= 'test'

require File.expand_path(File.dirname(__FILE__) + "/../fixture_rails_root/config/environment")

def load_schema
  config = YAML::load(IO.read(File.dirname(__FILE__) + '/../fixture_rails_root/config/database.yml'))
  db_adapter = 'sqlite3'
  ActiveRecord::Base.establish_connection(config[db_adapter])
  load(File.dirname(__FILE__) + '/../fixture_rails_root/db/schema.rb')
  require File.dirname(__FILE__) + '/../init'
end

load_schema
require 'rspec/rails'
require 'support/models'
require 'support/blueprints'
require 'webrat'
require 'webrat/core/matchers'

$: << File.expand_path(File.dirname(__FILE__) + '/../lib/')
require 'report_ui'
RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
end
