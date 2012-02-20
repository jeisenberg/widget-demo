class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:relationship][:followed_id])
    @follower = User.find(params[:relationship][:follower_id])
    @follower.follow!(@user)
    respond_to do |format|
      format.js if request.xhr?
    end
  end
end
