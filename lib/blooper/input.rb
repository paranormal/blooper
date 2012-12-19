module Blooper
  class Input

    def initialize(input = STDIN)
      @input = input
    end

    def each
      @input.each do |line|
        line = Line.new(line)
        $log.debug('Log string "' + line.instance_variable_get(:@line).chomp +
                   '" is ' + (line.valid? ? '' : 'in') + 'valid')
        yield Rows.new(line.clean) if line.valid?
      end
    end

  end
end
