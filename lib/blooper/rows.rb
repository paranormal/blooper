module Blooper
  class Rows

    def initialize(line)
      @line = line
    end

    def rows
      Hash[*@line.split]
    end

    def save
      Access.new(self.rows).save
    end

  end
end
