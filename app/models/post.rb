class Post < ActiveRecord::Base
  
  belongs_to :user
  
  attr_accessible :title, :content, :user_id, :user_token
  
  attr_reader :user_token
  
  def user_token=(id)
    self.user_id = id
  end  
end
