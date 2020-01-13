class StocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: %i[create destroy]

  def index
    stock_item_ids = current_user.stocks.pluck(:item_id)
    @items         = Item.where(id: stock_item_ids)
  end

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
