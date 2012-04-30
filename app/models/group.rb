class Group < ActiveRecord::Base
  has_many :subgroups, :class_name => "Group", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Group", :foreign_key => "parent_id"

  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug

  attr_accessible :name, :parent_id, :slug

  before_save :update_slug

  def update_slug
    self.slug = name.gsub(' ','').underscore
  end
end
