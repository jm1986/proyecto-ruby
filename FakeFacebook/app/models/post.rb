class Post < ActiveRecord::Base
  attr_accessible :body, :user

  #validates_presence_of :body, :user
  validates :body, :user, :presence => true
 
end
