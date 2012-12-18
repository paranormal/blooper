require_relative 'blooper/input.rb'
require_relative 'blooper/line.rb'
require_relative 'blooper/rows.rb'
require_relative 'blooper/model/access.rb'

module Blooper
  class << self

    def connect_db
      ActiveRecord::Base
        .establish_connection(YAML.load(ARGV.join(" ").gsub(/:/, ': ')))
    end

    def reconnect_db!
      ActiveRecord::Base.connection.reconnect!
    end

  end
end
