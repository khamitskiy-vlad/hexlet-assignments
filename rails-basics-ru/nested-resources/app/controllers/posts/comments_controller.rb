# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]
  before_action :set_post, only: %i[index new create]
  def index
    @post_comments = @post.post_comments
  end

  def show; end

  def new
    @post_comment = @post.post_comments.build
  end

  def edit; end

  def create
    @post_comment = @post.post_comments.build(post_comment_params)

    if @post_comment.save
      redirect_to post_path(@post), notice: 'Post comment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post_comment.update(post_comment_params)
      redirect_to post_path(@post_comment.post), notice: 'Post comment was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post_comment.destroy!

    redirect_to post_comments_url, notice: 'Post comment was successfully destroyed.'
  end

  private

  def set_comment
    @post_comment = PostComment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def post_comment_params
    params.require(:post_comment).permit(:body, :post_id)
  end
end
