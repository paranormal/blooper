class Rows

  REG = Regexp.new('.*squid\[\d+\]:\s')

  def initialize(line)
    @line = line.sub(REG, '')
  end

  def rows
    Hash[*@line.split]
  end

end
