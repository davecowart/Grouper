class Membership < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  belongs_to :role

  validates_presence_of :group_id, :user_id, :role_id
  validates_uniqueness_of :group_id, :scope => :user_id

  attr_accessible :group_id, :user_id, :group, :user
  attr_accessor :role_id
end
