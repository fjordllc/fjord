class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_my_comment, only: %i(edit update destroy)

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    redirect_url = params[:return_to] || root_url

    if @comment.save
      redirect_to redirect_url, notice: 'コメントを投稿しました。'
    else
      render :index
    end
  end

  def update
    redirect_url = params[:return_to] || root_url

    if @comment.update(comment_params)
      redirect_to redirect_url, notice: 'コメントを編集しました。'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_url = params[:return_to] || root_url
    redirect_to redirect_url, notice: 'コメントを削除しました。'
  end

  private
    def set_my_comment
      @comment = current_user.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :date, :owner_id)
    end
end
