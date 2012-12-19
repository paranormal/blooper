module Blooper
  class Rows

    def initialize(line = STDIN)
      @line = line
    end

    def rows
      Hash[*@line.split]
    end

    def save
      $log.debug('Data was saved') if Access.new(rows).save!
    end

  end
end
