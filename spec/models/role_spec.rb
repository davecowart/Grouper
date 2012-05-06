require 'spec_helper'

describe Role do
  before(:each) do
    FactoryGirl.create(:role)
  end
  it {should validate_presence_of(:name)}
  it {should validate_uniqueness_of(:name)}
end
