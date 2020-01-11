class UsersController < ApplicationController
  before_action :set_user, only: :show

  def index
    @users = User.page(params[:page]).order(:name)
  end

  def show
    @items = @user.items.recent
    @stocked_items = @user.stocked_items.recent
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following.order(:name).page(params[:page])
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.order(:name).page(params[:page])
    render 'show_follow'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
