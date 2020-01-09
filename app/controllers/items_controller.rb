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

    respond_to do |format|
      if @item.save
        format.html { redirect_to user_item_url(@user, @item), notice: '作成しました' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to user_item_url(@user, @item), notice: '更新しました' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to user_url(@user), notice: '削除しました' }
      format.json { head :no_content }
    end
  end

  private
  def set_item
    @item = @user.items.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def item_params
    params.require(:item).permit(:title, :body, :tag_list)
  end
end
