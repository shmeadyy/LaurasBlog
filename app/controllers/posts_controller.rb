class PostsController < ApplicationController
  def new  #this new action is creating a new post
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new' #render is used instead of redirect_to when save returns false.  the rendering is done within the same request as the form submission, redirect_to will tell the browser to issue another request.
    end
  end

  def show
    @post = Post.find(params[:id]) #use that instance variable in your view!
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :text))
      redirect_to @post
    else
      render 'edit'
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :text)
    end
end