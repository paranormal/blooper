require 'logger' 
require 'logger-application' unless defined?(Logger::Application)

require 'blooper/version.rb'
BLOOPER_VERSION = Blooper::VERSION

require 'blooper/db.rb'
require 'blooper/input.rb'
require 'blooper/line.rb'
require 'blooper/tuple.rb'

module Blooper

  class << self
    # Current Blooper Application
    def application
      @application ||= Application.new
    end
  end


  class Application < Logger::Application

    DATE_FORMAT = '%Y/%m/%d %H:%M:%S'
    LOGGER_LEVEL = Logger::INFO

    def initialize
      super('Blooper')
      self.level = $VERBOSE && Logger::DEBUG || LOGGER_LEVEL
      self.logger.formatter = formatter
    end

    def run
      @log.info('Establishing the database connection')
      DB.instance
      @log.info('A database connection has been established')
      Input.each do |tuple|
        begin
          tuple.save
          @log.debug('Data was saved')
        rescue Sequel::DatabaseDisconnectError
          @log.warn('A database connection has been lost, reconnecting...')
          DB.instance.connect
          retry
        rescue Sequel::Error => error
          @log.error(error.message.gsub(/\n.*/s, ''))
          next
        end
      end
    end

    private

    def formatter
      -> severity, date_time, app_name, msg do
        "#{date_time.strftime(DATE_FORMAT)} " +
        "#{app_name}(#{severity[0]})| #{msg}\n"
      end
    end

  end
end
