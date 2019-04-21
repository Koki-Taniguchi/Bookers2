class FollowsController < ApplicationController
  def create
    follow = current_user.follows.new
    user = User.find(params[:user_id])
    follow.follow_id = user.id
    follow.save
    redirect_to user_path(user)
  end

  def destroy
    user = User.find(params[:user_id])
    follow = current_user.follows.find_by(follow_id: user.id)
    follow.destroy
    redirect_to user_path(user)
  end
end
