class Input

  REG = Regexp.new('^L')

  def initialize(input)
    @input = input
  end

  def each
    @input.each do |line|
      yield Rows.new(self.clean(line)) if self.valid?(line)
    end
  end

  def valid?(line)
    line.match(REG)
  end

  def clean(line)
    line.sub(REG, '')
  end

end
