# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %w[show edit update destroy]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    if @post.save
      redirect_to post_path(@post), notice: 'Post was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Post was successfully updated'
    else
      render :edit, notice: "Post could't be updated"
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: 'Post was successfully deleted'
    else
      redirect_to post_path(@post), notice: "Post could't be deleted"
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :summary, :published)
  end
end
