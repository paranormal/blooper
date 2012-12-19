module Blooper
  class Rows

    def initialize(line)
      @line = line
    end

    def rows
      Hash[*@line.split]
    end

    def save
      if Access.new(rows).save
        $log.debug('Data was saved')
      end
    rescue => e
      $log.error("Data wasn't saved => " + e.message)
    end

  end
end
