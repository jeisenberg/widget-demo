class PostsController < ApplicationController
  #performance reasons - turn off layout rendering and sessions
  #layout nil
  #session :off
  before_filter :set_access_control_headers
  #this allows us to do ajax calls from another domain - need to check out security implications
  # see http://blog.jetthoughts.com/2010/12/22/allow-multiple-access-control-requests-for-rails/

  
  def index
    @posts = Post.all
    q = params[:q].blank? ? "" : params[:q]
    @posts = Post.where("title like ?", "%#{q}%")

    respond_to do |format|
      format.json { render json: @posts.map(&:title) }
    end
  end
  
  def show
    @post = Post.find(params[:id])
    # Store HTML in a variable rather than returning in to the browser
    html = render_to_string(:partial => 'posts/widget')
    # Build a JSON object containing our HTML
    html = to_json_value(html)
    #clean out the html garbage
    json = {"html" => html}.to_json
    # Get the name of the JSONP callback created by jQuery
    callback = params[:callback]
    # Wrap the JSON object with a call to the JSONP callback
    jsonp = callback + "(" + json + ")"
    # Send result to the browser
    render :text => jsonp,  :content_type => "text/javascript"
    puts html
    puts jsonp

  end
  
  def widget
    @post = Post.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      respond_to do |format|
        format.js
        format.html
      end
    else
      render :text => @post.errors
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url, :notice => "Successfully destroyed post."
  end
  
  def to_json_value(str)
      str.gsub!("\"", "")
      str.gsub!(/\n+/, " ")
      str
  end
end
