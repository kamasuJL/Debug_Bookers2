class RelationshipsController < ApplicationController
  before_action :authenticate_user!


  def create
    #user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    #user = User.find(params[:user_id])
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def following
    user = User.find(params[:user_id])
    @users = user.following
  end

  def followeds
    user = User.find(params[:user_id])
    @users = user.followeds
  end

end
