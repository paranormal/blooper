class Input

  SYSLOG_REG = Regexp.new('.*squid\[\d+\]:\s')
  DEAMON_REG = Regexp.new('^L')

  def initialize(input)
    @input = input
  end

  def each
    @input.each do |line|
      yield Rows.new(self.clean(line)) if self.valid?(line)
    end
  end

  def valid?(line)
    line.match(SYSLOG_REG) or line.match(DEAMON_REG)
  end

  def clean(line)
    line.sub!(SYSLOG_REG, '') or line.sub!(DEAMON_REG, '')
  end

end
