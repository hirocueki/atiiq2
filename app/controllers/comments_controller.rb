class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_item

  def edit
  end

  def create
    @comment = @item.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to user_item_url(@user, @item), notice: '作成しました'
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to user_item_url(@user, @item), notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy!
    redirect_to user_item_url(@user, @item), alert: '削除しました'
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_item
      @item = @user.items.find(params[:item_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
