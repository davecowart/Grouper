class Group < ActiveRecord::Base
  has_many :subgroups, :class_name => "Group", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Group", :foreign_key => "parent_id"
  has_many :memberships
  has_many :users, :through => :memberships

  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug

  attr_accessible :name, :parent_id, :slug

  before_validation :update_slug

  def update_slug
    self.slug = name.gsub(' ','').underscore if name != nil
  end
end