require "spec_helper"

describe "example" do
  it "has Augeas['net.ipv4.ip_forward']" do
    should contain_augeas("net.ipv4.ip_forward")
  end

  describe_augeas "net.ipv4.ip_forward", :lens => 'Sysctl', :target => 'etc/sysctl.conf'  do
    it "should run" do
      should execute.with_change
      aug_get("net.ipv4.ip_forward").should == "1"
      should execute.idempotently
    end
  end

  describe_augeas "fail net.ipv4.ip_forward" do
    it "should run" do
      should execute.with_change
    end
  end
end
