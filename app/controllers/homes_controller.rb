class HomesController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).recent
    @user  = current_user
  end
end
