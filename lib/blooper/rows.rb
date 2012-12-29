module Blooper
  class Rows

    def initialize(line = STDIN)
      @line = line
    end

    def rows
      Hash[*@line.split]
    end

    def save
      DB.instance.insert(rows)
    end

  end
end
