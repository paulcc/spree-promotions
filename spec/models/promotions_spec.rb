require File.dirname(__FILE__) + '/../spec_helper'

describe Promotions do
  before(:each) do
    @promotions = Promotions.new
  end

  it "should be valid" do
    @promotions.should be_valid
  end
end
