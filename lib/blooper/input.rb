module Blooper
  class Input

    attr_reader :flow

    def initialize(flow = STDIN)
      @flow = flow
    end

    def self.each(*args)
      Input.new(*args).flow.each do |line|
        line = Line.new(line)
        yield Tuple.new(line.clean) if line.valid?  rescue ArgumentError
      end
    end

  end
end
