module Blooper
  class Tuple

    def initialize(line)
      @line = line
    end

    def tuples
      h = Hash[*@line.split]
      h.merge(h) {|k,v| v.eql?('-') ? nil : v}
    end

    def save
      DB.instance.insert(tuples)
    end

  end
end
