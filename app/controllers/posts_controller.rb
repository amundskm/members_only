class PostsController < ApplicationController
  def index
    @posts = Posts.paginate(page: params[:page])
  end

  def create
  end

  def destroy
  end

end
