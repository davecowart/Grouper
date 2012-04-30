require 'spec_helper'

describe Group do
  before(:each) do
    FactoryGirl.create(:group)
  end
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:slug)}
  it {should validate_uniqueness_of(:name)}
  it {should validate_uniqueness_of(:slug)}
end
