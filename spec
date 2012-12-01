require "line"
describe Line do

  before(:all) do
    @logstr = 'Ltime 1352420926.507 response_time 513 src_ip 10.10.0.5' +
      ' squid_request_status TCP_MISS http_status_code 200 reply_size 22046' +
      ' request_method GET request_url http://wiki.squid-cache.org/Features/' +
      'LogModules username - squid_hier_code HIER_DIRECT dst_ip 77.93.254.178' +
      ' mime_type text/html'
  end

  it "should get some object for new instance and named it @input" do
    input = Line.new(@logstr)
    input.should be_valid
    input.clean.should == @logstr.sub(Line::REG, '')
  end

end


require "database.rb"
describe Database do
  it "should connect" do
  end
end
