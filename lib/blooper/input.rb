module Blooper
  class Input

    def initialize(input)
      @input = input
    end

    def each
      @input.each do |line|
        $log.debug('Log string => ' + line)
        line = Line.new(line)
        $log.debug('Log string is ' + (line.valid? ? '' : 'in') + 'valid')
        yield Rows.new(line.clean) if line.valid?
      end
    end

  end
end
