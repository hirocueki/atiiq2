class HomesController < ApplicationController
  def index
    @items = Item.all.recent
  end
end
