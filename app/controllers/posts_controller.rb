class PostsController < ApplicationController
  def index
      @posts = Post.paginate(page: params[:page])
  end

  def create
  end

  def destroy
  end

end
