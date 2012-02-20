class UsersController < ApplicationController
  before_filter :set_access_control_headers
  def index
    q = params[:q]
    @user = User.where("name like ?", "%#{q}%")
    respond_to do |format|
      format.html
      format.json { render json: @user}
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    puts "new user"
    @user = User.new
  end

  def create
    puts "create user"
    @user = User.new(params[:user])
    if @user.save(:validate => false)
      redirect_to @user, :notice => "Successfully created user."
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :notice  => "Successfully updated user."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, :notice => "Successfully destroyed user."
  end
end
