class WelcomeController < ApplicationController
  def index
    @posts = Post.order('created_at DESC').page(params[:page]).per_page(5)
  end
end
