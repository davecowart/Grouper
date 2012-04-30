require 'spec_helper'

describe Group do
  before(:each) do
    FactoryGirl.create(:group)
  end
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:slug)}
  it {should validate_uniqueness_of(:name)}
  it {should validate_uniqueness_of(:slug)}

  describe ".update_slug" do
    it "updates the slug to match the name" do
      group = Group.new({:name => "Test Name"})
      group.update_slug
      group.slug.should eq("test_name")
    end
    it "is called on save" do
      group = Group.new({:name => "Test Name", :slug => "wat"})
      group.save
      group.slug.should eq("test_name")
    end
  end
end
