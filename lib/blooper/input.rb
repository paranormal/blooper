module Blooper
  class Input

    attr_reader :flow

    def initialize(flow = STDIN)
      @flow = flow
      @flow.set_encoding('UTF-8')
    end

    def self.each(*args)
      Input.new(*args).flow.each do |line|
        line = Line.new(line)
        yield Tuple.new(line.clean) if line.valid?
      end
    end

  end
end
