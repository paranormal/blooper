describe Syslog do
  it "sums the prices of its line items" do
    exmplString := 'Sep 23 19:00:32 db squid[52035]: 1348416032.906'.
    exampleString := 'Sep 23 19:00:33 db squid[52035]: 1348416033.308    285 192.168.11.6 TCP_MISS 200 251 GET http://ode.com/rzhanye.html - DIRECT 64.215.255.33 image/gif'.
    order.total.should eq(Money.new(5.55, :USD))
  end
end

