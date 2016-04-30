class HeartsController < ApplicationController
  respond_to :js

  def heart
    @user = current_user
    @post = Post.find(params[:post_id])
    @user.heart!(@post)
  end
  def unheart
    @user = current_user
    @heart = @user.hearts.find_by_post_id(params[:post_id])
    @post = Post.find(params[:post_id])
    @heart.destroy!
  end
end
