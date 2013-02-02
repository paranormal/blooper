module Blooper
  module Input

    def each(input = STDIN)
      input.each do |line|
        line = Line.new(line)
        yield Tuple.new(line.clean) if line.valid?
      end
    end

    module_function :each

  end
end
