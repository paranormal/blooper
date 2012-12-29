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
      $log = @log
    end

    def run
      connect
      require_relative 'blooper/model/access.rb'
      input = Input.new
      input.each do |rows|
        begin
          rows.save
        rescue Sequel::Error => error
          case error.message
          when "PG::Error: connection not open\n"
            connect
            retry
          else
            $log.error('Data was not saved => ' + e.message)
            next
          end
        end
      end
    end

    private

    def connect
      $log.info('Establishing the database connection')
      Sequel.connect(connect_params)
      $log.info('A database connection has been established')
    end

    def connect_params
      $log.debug('Database credential => ' + ARGV.to_s)
      YAML.load(ARGV.join(" ").gsub(/:/, ': '))
    end

    def formatter
       -> severity, datetime, appname, msg do
        "#{datetime.strftime(DATE_FORMAT)} " +
         "#{appname}(#{severity[0]})| " +
         "#{msg}\n"
      end
    end

  end
end
