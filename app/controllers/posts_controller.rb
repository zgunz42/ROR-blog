class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 5)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to @post, :notice => 'zgunz your post ' << @post.title << ' created !'
    else
      render 'new', notice: 'zgunz sorry, something wrong :( !!'
    end
  end

  def edit
    # code here
  end

  def update
    # code here
    if @post.update post_params
      redirect_to @post, notice: 'succesfully updated!'
    else
      render 'edit'
    end
  end

  def destroy
    # code here
    @post.destroy
    redirect_to posts_path
  end

  private
  def find_post
    @post = Post.friendly.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:title, :content, :slug)
  end
end
