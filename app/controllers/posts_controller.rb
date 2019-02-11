class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @posts = Post.paginate(page: params[:page])
  end

  def edit
    @post = Post.find(params[:id])
    render 'edit'
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:sucess] = "Post updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def create
      @post = current_user.posts.build(post_params)
      if @post.save
        flash[:success] = "post created!"
        redirect_to user_path(current_user)
      else
        render root_url
      end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:sucess] = "Post deleted"
    redirect_to users_url
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end


end
