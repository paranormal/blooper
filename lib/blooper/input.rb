module Blooper
  class Input

    def initialize(input = STDIN)
      @input = input
    end

    def each
      @input.each do |line|
        line = Line.new(line)
        yield Rows.new(line.clean) if line.valid?
      end
    end

  end
end
