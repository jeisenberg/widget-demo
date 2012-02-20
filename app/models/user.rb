class User < ActiveRecord::Base
  
  has_many :posts
  attr_accessible :name, :email
  
  
  # add relationships
  has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy
  has_many :reverse_relationships, :foreign_key => "followed_id", :class_name => "Relationship", :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower
  has_many :following, :through => :relationships, :source => :followed
  
  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end
  
end
