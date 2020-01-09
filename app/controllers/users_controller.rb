class UsersController < ApplicationController
  before_action :set_user, only: :show

  def show
    @items = @user.items.recent
    #@stocked_items = @user.stocked_items.recent
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
