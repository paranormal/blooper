module Blooper
  class Rows

    def initialize(line)
      @line = line
    end

    def rows
      $log.debug(@line.split)
      Hash[*@line.split]
    rescue
      $log.error("received string isn't correct hash: " + @line.split)
    end

    def save
      if Access.new(rows).save
        $log.debug('data was successfully saved into database')
      end
    rescue => e
      $log.error("can't save into database" + rows)
    end

  end
end
