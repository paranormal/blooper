require_relative 'blooper/db.rb'
require_relative 'blooper/input.rb'
require_relative 'blooper/line.rb'
require_relative 'blooper/rows.rb'

module Blooper
  class Application < Logger::Application

    DATE_FORMAT = '%Y/%m/%d %H:%M:%S'
    LOGGER_LEVEL = Logger::INFO

    def initialize
      super('Blooper')
      self.level = $VERBOSE && Logger::DEBUG || LOGGER_LEVEL
      self.logger.formatter = formatter
      @input = Input.new
    end

    def run
      @log.info('Establishing the database connection')
      DB.instance
      @log.info('A database connection has been established')
      @input.each do |rows|
        begin
          rows.save
          $log.debug('Data was saved')
        rescue Sequel::Error => error
          @log.error(error.message)
          if error.message.match(/connection not open/)
            $log.warn('A database connection has been lost, reconnecting...')
            DB.instance.connect
            retry
          end
          next
        end
      end
    end

    private

    def formatter
       -> severity, datetime, appname, msg do
        "#{datetime.strftime(DATE_FORMAT)} " +
         "#{appname}(#{severity[0]})| " +
         "#{msg}\n"
      end
    end

  end
end
