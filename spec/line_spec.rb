require_relative 'spec_helper'

module Blooper
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
end
