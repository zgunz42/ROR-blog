class WelcomeController < ApplicationController
  def index
    @posts = Post.all.limit(5).order("created_at desc")
  end
end
