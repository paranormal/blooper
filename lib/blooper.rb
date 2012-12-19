require_relative 'blooper/input.rb'
require_relative 'blooper/line.rb'
require_relative 'blooper/rows.rb'
require_relative 'blooper/model/access.rb'

module Blooper
  class Application < Logger::Application

    def initialize
      super(self.class.name)
      self.level = $VERBOSE && Logger::DEBUG || Logger::INFO
      $log = @log
    end

    def connect
      $log.info('Establishing the database connection')
      $log.debug('Database credential => ' + ARGV.to_s)
      ActiveRecord::Base
        .establish_connection(YAML.load(ARGV.join(" ").gsub(/:/, ': ')))
      $log.info('A database connection has been initialized')
    end

    def run
      connect
      Input.new(STDIN).each do |rows|
        begin
          rows.save
        rescue ActiveRecord::StatementInvalid
          $log.warn('A database connection has been lost')
          provide_db
          redo
        end
      end
    end

  end
end
