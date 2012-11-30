class Line

  REG = Regexp.new('^L')

  def initialize(line)
    @line = line
  end

  def valid?
    @line.match(REG)
  end

  def clean
    @line.sub(REG, '')
  end

end
