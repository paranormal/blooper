module Blooper
  class Line

    REG = Regexp.new('^L')

    def initialize(line)
      @line = line
    end

    def valid?
      @line.match(REG) && @line.split.size.even?
    end

    def clean
      @line.sub(REG, '')
    end

  end
end
