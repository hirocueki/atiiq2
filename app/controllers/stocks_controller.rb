class StocksController < ApplicationController
  before_action :set_item

  def create
    @stock = current_user.stocks.create!(item: @item)
    @item.reload
  end

  def destroy
    stock = current_user.stocks.find_by!(user: current_user, item: @item)
    stock.destroy!
    @item.reload
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end
end
