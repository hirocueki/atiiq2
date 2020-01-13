class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def show
    following_user_ids = current_user.following.pluck(:id)
    @items             = Item.where(user_id: following_user_ids).page(params[:page]).recent
    @user              = current_user
  end
end
