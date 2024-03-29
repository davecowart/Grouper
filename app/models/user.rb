class User < ActiveRecord::Base
  acts_as_authentic

  has_many :memberships
  has_many :groups, :through => :memberships
  
  validates_presence_of :email, :first_name, :last_name, :gender
  validates_uniqueness_of :email

  attr_accessible :email, :first_name, :gender, :last_name, :password, :password_confirmation
end
