class PostsController < ApplicationController

def index
  @posts = Post.all
  @post = Post.new  # added
 
  respond_to do |format|
    format.html
  end
end
 
def create
  @post = Post.new(params[:post])
 
  respond_to do |format|
    if @post.save
  format.html { redirect_to posts_url, notice: 'Post was successfully created.' }
  format.json { render json: @post, status: :created, location: @post }
  format.js  #added
else
      format.html { render action: "index" } #changed
      format.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end
end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
      format.js #added
    end
  end
  
end
