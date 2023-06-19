class FriendshipsController < ApplicationController

  def create
    friend = User.find(params[:friend])
    current_user.friends << friend
    flash[:notice] = 'Following friend'
    redirect_to my_friends_path
  end

  def destroy
    friend = User.find(params[:id])
    friendship = Friendship.where(user_id: current_user.id, friend_id: friend.id).first.destroy
    flash[:notice] = "You stopped following #{friend.full_name}"
    redirect_to my_friends_path
  end
end
