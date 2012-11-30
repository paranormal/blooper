cwd = File.dirname(__FILE__)
require "database.rb"
require "input.rb"
require "line.rb"
require "rows.rb"

ENV['BUNDLE_GEMFILE'] ||= cwd + '/../Gemfile'
require "bundler"
Bundler.require

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


  # it "sums the prices of its line items" do
    # exmplString := 'Sep 23 19:00:32 db squid[52035]: 1348416032.906'.
    # exampleString := 'Sep 23 19:00:33 db squid[52035]: 1348416033.308    285 192.168.11.6 TCP_MISS 200 251 GET http://ode.com/rzhanye.html - DIRECT 64.215.255.33 image/gif'.
    # order.total.should eq(Money.new(5.55, :USD))
  # end

