module Blooper
  class Tuple

    SQL = {'-' => nil}

    def initialize(line)
      @line = line
    end

    def tuples
      Hash[*sql]
    end

    def save
      DB.instance.insert(tuples)
    end

    private

    def sql
      @line.split.map do |raw|
        SQL.has_key?(raw) ? SQL[raw] : raw
      end
    end

  end
end
