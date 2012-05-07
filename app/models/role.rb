class Role < ActiveRecord::Base
  has_many :memberships

  validates_presence_of :name
  validates_uniqueness_of :name

  #TODO: create a scoped association by group
  attr_accessible :name, :rank


  def self.find_by_membership(group_id, user_id)
    Membership.where(user_id: user_id, group_id: group_id).first.role
  end
end
