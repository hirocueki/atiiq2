class ItemsController < ApplicationController
  before_action :authenticate_user!,only: %i(new edit update destroy)
  before_action :set_user, only: %i(show new create edit update destroy)
  before_action :set_item, only: %i(show edit update destroy)

  def show
    @comment = Comment.new
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = @user.items.new(item_params)

    if @item.save
      redirect_to user_item_url(@user, @item), notice: '作成しました'
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to user_item_url(@user, @item), notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to user_url(@user), notice: '削除しました'
  end

  private
  def set_item
    @item = @user.items.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def item_params
    params.require(:item).permit(:title, :content, :tag_list)
  end
end
