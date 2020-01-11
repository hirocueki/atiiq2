class Tags::FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.tag_list << tag_name
    current_user.save!
    redirect_to tag_url(tag_name)
  end


  def destroy
    current_user.tag_list.remove(tag_name)
    current_user.save!
    redirect_to tag_url(tag_name)
  end


  private

  def tag_name
    params[:tag_name]
  end
end
