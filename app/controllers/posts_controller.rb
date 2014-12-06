class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def show
    @versions = @post.versions
    @version = @versions.find_by(lang: I18n.locale)
    if @version.present?
    else
      redirect_to :back
    end
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
    @versions = @post.versions
  end

  def create
    @post = Post.new(post_params)
    @post.save
    respond_with(@post)
  end

  def update
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    @post.destroy
    respond_with(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.fetch(:post, {}).permit(:is_published)
    end
end
