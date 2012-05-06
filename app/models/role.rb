class Role < ActiveRecord::Base
  has_many :memberships

  validates_presence_of :name
  validates_uniqueness_of :name

  #TODO: create a scoped association by group
  attr_accessible :name, :rank
end
