# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  def edit
    @comment = resource_post.comments.find params[:id]
  end

  def create
    @comment = PostComment.new(comment_params)
    @comment.post = resource_post

    if @comment.save
      redirect_to resource_post, notice: 'Comment was successfully created.'
    else
      @post = resource_post

      flash[:alert] = 'Comment has not been added'
      render 'posts/show', status: :unprocessable_entity
    end
  end

  def update
    @comment = resource_post.comments.find params[:id]

    if @comment.update(comment_params)
      redirect_to resource_post, notice: 'Comment was successfully updated.'
    else
      flash[:alert] = 'Comment has not been updated'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = PostComment.find params[:id]

    @comment.destroy

    redirect_to resource_post
  end

  private

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:post_comment).permit(:body)
  end
end
