require_relative 'blooper/input.rb'
require_relative 'blooper/line.rb'
require_relative 'blooper/rows.rb'
require_relative 'blooper/model/access.rb'

module Blooper
  class Application < Logger::Application

    def initialize
      super(self.class.name)
      logger!
      connect!
    end

    def logger!
      level = $VERBOSE && Logger::DEBUG || Logger::INFO
      $log = @log
    end

    def connect!
      $log.info('establishing the database connection')
      ActiveRecord::Base
        .establish_connection(YAML.load(ARGV.join(" ").gsub(/:/, ': ')))
      $log.info('a database connection has been initialized')
    end

    def run
      Input.new(STDIN).each do |rows|
        begin
          rows.save
        rescue ActiveRecord::StatementInvalid
          $log.warn('a database connection has been lost')
          provide_db
          redo
        end
      end
    end

  end
end
