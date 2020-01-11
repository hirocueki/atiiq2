class TagsController < ApplicationController
  def show
    @tag_name  = params[:name]
    @items     = Item.tagged_with(@tag_name)
    @followers = User.tagged_with(@tag_name).count
  end
end
