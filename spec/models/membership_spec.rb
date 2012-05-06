require 'spec_helper'

describe Membership do
  before(:each) do
    FactoryGirl.create(:membership)
  end
  it {should validate_presence_of(:group_id)}
  it {should validate_presence_of(:user_id)}
  it {should validate_presence_of(:role_id)}
  it "should validate uniqueness of user_id and group_id" do
    first = Membership.first
    second = Membership.new({:group_id => first.group_id, :user_id => first.user_id})
    second.save
    second.errors[:group_id].should eq(["has already been taken"])
  end
end
