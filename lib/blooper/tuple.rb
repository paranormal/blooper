module Blooper
  class Tuple

    NULL = {'-' => nil}

    def initialize(line)
      @line = line
    end

    def tuples
      Hash[*null_convert]
    end

    def save
      DB.instance.insert(tuples)
    end

    private

    def null_convert
      @line.split.map {|word| NULL.has_key?(word) ? NULL[word] : word}
    end

  end
end
