require 'active_record'
require File.join(File.expand_path("../", __FILE__), 'app_logger.rb')

module Database
  module Connector
    extend self

    def establish_connection
      ActiveRecord::Base.establish_connection(config)
    end

    private

    def config
      config_file_path = File.join(File.expand_path("../..", __FILE__), 'database.yml')
      YAML.load_file(config_file_path)[ENV['RACK_ENV'] || 'development']
    end
  end
end

Database::Connector.establish_connection
ActiveRecord::Base.logger = ::AppLogger.logger_instance if ENV['RACK_ENV'] == 'development'