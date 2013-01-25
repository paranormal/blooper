module Blooper
  class Line

    REG = Regexp.new('^L')

    def initialize(line)
      @line = line
    end

    def valid?
      @line.match(REG) && even?
    end

    def even?
      @line.split.size.even? ? true : raise(ArgumentError)
    end

    def clean
      @line.sub(REG, '')
    end

  end
end
