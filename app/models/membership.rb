class Membership < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  validates_presence_of :group_id, :user_id
  validates_uniqueness_of :group_id, :scope => :user_id

  attr_accessible :group_id, :user_id, :group, :user
end
