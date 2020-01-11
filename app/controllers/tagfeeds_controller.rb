class TagfeedsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @followed_tag_list = current_user.tag_list
    @items = Item.tagged_with(@followed_tag_list, any: true).newer.page(params[:page]).per(10)
  end
end
