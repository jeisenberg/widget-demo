class Post < ActiveRecord::Base
  
  belongs_to :user
  
  attr_accessible :title, :content, :user_id
end
