require_relative 'spec_helper'

module Blooper
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
end
