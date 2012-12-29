module Blooper
  class DB

    include Singleton

    def initialize
      @credentials = credentials
      @accesses = connect
    end

    def connect
      Sequel.connect(@credentials)[:accesses]
    end

    def insert(params)
      @accesses.insert(params)
    end

    private

    def credentials
      YAML.load(ARGV.join(" ").gsub(/:/, ': '))
    end

  end
end
