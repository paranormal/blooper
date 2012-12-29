module Blooper
  class Rows

    def initialize(line = STDIN)
      @line = line
    end

    def rows
      Hash[*@line.split]
    end

    def save
      if Access.new(rows).save_changes
        $log.debug('Data was saved')
      end
    end

  end
end
