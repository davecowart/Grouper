class Group < ActiveRecord::Base
  has_many :subgroups, :class_name => "Group", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Group", :foreign_key => "parent_id"
  has_many :memberships
  has_many :users, :through => :memberships

  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug

  attr_accessible :name, :parent_id, :slug

  before_validation :update_slug

  def self.available(user_id)
    joins("left join memberships on groups.id = memberships.group_id and memberships.user_id = #{user_id}").where("memberships.id is null")
  end

  def self.find_by_admin_rights(user_id)
    joins("left join memberships on groups.id = memberships.group_id", "left join roles on memberships.role_id = roles.id").where("roles.rank >= 10").where("memberships.user_id = ?", user_id)
  end

  def self.find_with_no_parent
    where(parent_id: nil).order(:name)
  end

private

  def update_slug
    self.slug = name.gsub(' ','').underscore unless name.nil?
  end
end
