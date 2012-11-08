class Input

  def initialize(input)
    @input = input
  end

  def each
    @input.each do |line|
     yield Rows.new(line)
   end
  end

end
