module Blooper
  class Input

    def initialize(input)
      @input = input
    end

    def each
      @input.each do |line|
        $log.debug('received log string: ' + line)
        line = Line.new(line)
        yield Rows.new(line.clean) if line.valid?
      end
    end

  end
end
