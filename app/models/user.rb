class User < ActiveRecord::Base
  acts_as_authentic
  
  attr_accessible :email, :first_name, :gender, :last_name, :password, :password_confirmation
end
