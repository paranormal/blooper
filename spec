# encoding: utf-8
require 'ap'

require_relative 'lib/blooper/input'
require_relative 'lib/blooper/line'
require_relative 'lib/blooper/tuple'

include Blooper

describe Input do

  before(:each) do
    @stdin = stub_const("STDIN", Class.new)
    @stdin.stub(set_encoding: 'UTF-8')
  end

  it 'should bind proper flow' do
    Input.new.flow.should eql(@stdin)
    Input.new(STDIN).flow.should eql(@stdin)
  end

  it "should return correct line" do
    @stdin.should_receive(:each).and_yield('Ltime 2013-01-20_07:40:39.3N+0200')
    expect {|b| Input.each(&b) }.to yield_with_args(Tuple)
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
    it "should convert a pair-words string into hash" do
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

  it "should recognise bad encoding" do
    @line.instance_variable_set(:@line, @logstr.sub(/513/, '543|Misérаblesё'))
    @line.should be_valid
    @line.instance_variable_set(:@line, @logstr.sub(/513/, 'q=��������+�����+������+���������+�������&src=IE-Address'))
    @line.should be_valid
  end

end
