require_relative 'lib/blooper/input'
require_relative 'lib/blooper/line'
require_relative 'lib/blooper/tuple'

include Blooper

describe Input do

  context 'new object creation' do
    it "should accept input and map it to @input" do
      input = Input.new('aoeu')
      input.instance_variable_get(:@input).should be_true
    end
    it "should map @input to STDIN if no input were given" do
      stdin = stub_const("STDIN", Class.new)
      input = Input.new
      input.instance_variable_get(:@input).equal?(stdin).should be_true
    end
  end

  context 'iteration behaviour' do

    before(:each) do
      @stdin = stub_const("STDIN", Class.new)
    end

    it "should return correct line" do
      @stdin.should_receive(:each).and_yield('Ltime 2013-01-20_07:40:39.3N+0200')
      Input.new.each do |rows|
        rows.should be_a_kind_of(Tuple)
        rows.instance_variable_get(:@line).should eql('time 2013-01-20_07:40:39.3N+0200')
      end
    end

  end

end

describe Tuple do

  before(:each) do
    @line = mock("time 2013-01-20_07:40:39.3N+0200")
    @tuple = Tuple.new(@line)
  end

  context 'instance methods' do
    it 'should respond to a tuples and save' do
      @tuple.should respond_to(:tuples)
      @tuple.should respond_to(:save)
    end
  end

  context 'instance behaviour' do
    it 'should include line instance variable' do
      @tuple.instance_variable_get(:@line).should be_true
    end
  end

  context 'instance tuples method' do
    it "should return an empty hash for empty string" do
      @tuple.instance_variable_set(:@line, '')
      @tuple.tuples.should have(0).items
    end
    it "should convert a pair-words string to hash" do
      @tuple.instance_variable_set(:@line, 'time 2013-01-20_07:40:39.3N+0200')
      @tuple.tuples.should be_a_kind_of(Hash)
      @tuple.tuples.should have_key('time')
      @tuple.tuples.should have_value('2013-01-20_07:40:39.3N+0200')
    end
    it "should raise ArgumentError for non pair-words string" do
      @tuple.instance_variable_set(:@line, 'time ')
      expect {@tuple.tuples}.to raise_error(ArgumentError)
    end
    it "should convert a - into nil value" do
      @tuple.instance_variable_set(:@line, 'time -')
      @tuple.tuples.should have_key('time')
      @tuple.tuples.should have_value(nil)
    end
  end

end


describe Line do

  before(:each) do
    @logstr = 'Ltime 1352420926.507 response_time 513 src_ip 10.10.0.5' +
      ' squid_request_status TCP_MISS http_status_code 200 reply_size 22046' +
      ' request_method GET request_url http://wiki.squid-cache.org/Features/' +
      'LogModules username - squid_hier_code HIER_DIRECT dst_ip 77.93.254.178' +
      ' mime_type text/html'
    @line = Line.new(@logstr)
  end

  it "should recognise correct line" do
    @line.should be_valid
    @line.instance_variable_set(:@line, '')
    @line.should_not be_valid
    @line.instance_variable_set(:@line, @logstr.sub(/513/, ''))
    @line.should_not be_valid
  end

  it "should clean line respectively" do
    @line.clean.should eql(@logstr.sub(Line::REG, ''))
  end

end
